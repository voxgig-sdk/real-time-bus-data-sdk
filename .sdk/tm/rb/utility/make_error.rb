# RealTimeBusData SDK utility: make_error
require_relative '../core/operation'
require_relative '../core/result'
require_relative '../core/error'
module RealTimeBusDataUtilities
  MakeError = ->(ctx, err) {
    if ctx.nil?
      require_relative '../core/context'
      ctx = RealTimeBusDataContext.new({}, nil)
    end
    op = ctx.op || RealTimeBusDataOperation.new({})
    opname = op.name
    opname = "unknown operation" if opname.empty? || opname == "_"

    result = ctx.result || RealTimeBusDataResult.new({})
    result.ok = false

    err = result.err if err.nil?
    err = ctx.make_error("unknown", "unknown error") if err.nil?

    errmsg = err.is_a?(RealTimeBusDataError) ? err.msg : err.to_s
    msg = "RealTimeBusDataSDK: #{opname}: #{errmsg}"
    msg = ctx.utility.clean.call(ctx, msg)

    result.err = nil
    spec = ctx.spec

    if ctx.ctrl.explain
      ctx.ctrl.explain["err"] = { "message" => msg }
    end

    sdk_err = RealTimeBusDataError.new("", msg, ctx)
    sdk_err.result = ctx.utility.clean.call(ctx, result)
    sdk_err.spec = ctx.utility.clean.call(ctx, spec)
    sdk_err.code = err.code if err.is_a?(RealTimeBusDataError)

    ctx.ctrl.err = sdk_err

    # Opt-out escape hatch: when throwing is explicitly disabled, return the
    # bare result data instead of raising.
    if ctx.ctrl.throw_err == false
      return result.resdata
    end
    # Default idiomatic path: raise the already-constructed exception.
    raise sdk_err
  }
end
