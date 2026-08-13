# RealTimeBusData SDK utility: make_context

from realtimebusdata_sdk.core.context import RealTimeBusDataContext


def make_context_util(ctxmap, basectx):
    return RealTimeBusDataContext(ctxmap, basectx)
