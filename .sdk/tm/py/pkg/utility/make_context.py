# RealTimeBusData SDK utility: make_context

from projectname_sdk.core.context import RealTimeBusDataContext


def make_context_util(ctxmap, basectx):
    return RealTimeBusDataContext(ctxmap, basectx)
