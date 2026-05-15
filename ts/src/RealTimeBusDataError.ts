
import { Context } from './Context'


class RealTimeBusDataError extends Error {

  isRealTimeBusDataError = true

  sdk = 'RealTimeBusData'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  RealTimeBusDataError
}

