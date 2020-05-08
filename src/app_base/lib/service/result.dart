import 'dart:core';

class Result {
    Object _data;
    
    final EResultStatus status;
    Object get data => _data;

    final int code;
    final String message;
    final String detail;

    bool get ok => status == EResultStatus.Success;
    bool get failed => !ok;

    Result(this.status, Object data, this.code, this.message, this.detail) {
        _data = data;
    }

    static Result exception(Exception ex) {
        return Result(EResultStatus.Exception, null, ex.hashCode, "Ocorreu um erro na operação solicitada.", ex.toString());
    }

    static Result success({Object data, String message}) {
        return Result(EResultStatus.Success, data, 1, message, null);
    }    
}

class TypedResult<TData> extends Result {
    TData get data => super.data as TData;

    TypedResult({status, TData data, code, message, detail}) : super(status, data, code, message, detail);

    static TypedResult<TData> fail<TData>(String failMessage, {String failDetail}) {
        return TypedResult(status: EResultStatus.Exception, data: null, code: 0, message: failMessage, detail: failDetail);
    }

    static TypedResult<TData> exception<TData>(Exception ex) {
        return TypedResult(status: EResultStatus.Exception, data: null, code: ex.hashCode, message: "Ocorreu um erro na operação solicitada.", detail: ex.toString());
    }

    static TypedResult<TData> success<TData>(TData data, {String message}) {
        return TypedResult(status: EResultStatus.Success, data: data, code: 1, message: message, detail: null);
    } 
}

enum EResultStatus {
    Exception,
    Fail,
    Success
}