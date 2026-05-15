-- RealTimeBusData SDK error

local RealTimeBusDataError = {}
RealTimeBusDataError.__index = RealTimeBusDataError


function RealTimeBusDataError.new(code, msg, ctx)
  local self = setmetatable({}, RealTimeBusDataError)
  self.is_sdk_error = true
  self.sdk = "RealTimeBusData"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function RealTimeBusDataError:error()
  return self.msg
end


function RealTimeBusDataError:__tostring()
  return self.msg
end


return RealTimeBusDataError
