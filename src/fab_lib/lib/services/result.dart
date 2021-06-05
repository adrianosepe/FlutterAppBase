part of fab_lib;

enum EResultStatus { Exception, Fail, Success }

class Result {
  Object _data;

  final EResultStatus status;
  Object get data => _data;

  int code;

  final String message;
  final String detail;

  bool get ok => status == EResultStatus.Success;
  bool get failed => !ok;

  Result(this.status, Object data, this.message, {int code, this.detail}) {
    _data = data;
    code = code ?? this.hashCode;
  }

  static Result exception(Exception ex) {
    return Result(EResultStatus.Exception, null, "Ocorreu um erro na operação solicitada.", code: ex.hashCode, detail: ex.toString());
  }

  static Result fail(String message) {
    return Result(EResultStatus.Fail, null, message);
  }

  static Result success(String message, {Object data}) {
    return Result(EResultStatus.Success, data, message);
  }
}

class TypedResult<TData> extends Result {
  TData get data => super.data as TData;

  TypedResult({status, TData data, code, message, detail}) : super(status, data, message, code: code, detail: detail);

  static TypedResult<TData> fail<TData>(String failMessage, {String failDetail}) {
    return TypedResult(status: EResultStatus.Exception, message: failMessage, detail: failDetail);
  }

  static TypedResult<TData> exception<TData>(Exception ex) {
    return TypedResult(status: EResultStatus.Exception, code: ex.hashCode, message: "Ocorreu um erro na operação solicitada.", detail: ex.toString());
  }

  static TypedResult<TData> success<TData>(TData data, {String message}) {
    return TypedResult(status: EResultStatus.Success, data: data, message: message);
  }
}
