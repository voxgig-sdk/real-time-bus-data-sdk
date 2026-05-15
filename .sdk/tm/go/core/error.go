package core

type RealTimeBusDataError struct {
	IsRealTimeBusDataError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewRealTimeBusDataError(code string, msg string, ctx *Context) *RealTimeBusDataError {
	return &RealTimeBusDataError{
		IsRealTimeBusDataError: true,
		Sdk:              "RealTimeBusData",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *RealTimeBusDataError) Error() string {
	return e.Msg
}
