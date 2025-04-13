part of fab_lib;

class Result extends TypedResult<Object> {
  Result({
    required EResultStatus status,
    List<ResultInfo>? details,
    String? message,
    Object? data,
  }) : super(
          status: status,
          details: details,
          message: message,
          data: data,
        );

  static Result error(
    String error, {
    List<ResultInfo>? details,
  }) =>
      Result(
        status: EResultStatus.error,
        details: details,
        message: error,
      );

  static Result exception(Exception ex) => error(ex.toString());

  static Result success({Object? data, String? message}) => Result(status: EResultStatus.ok, message: message, data: data);

  static Result warning(String alert) => Result(status: EResultStatus.warning, message: alert);

  factory Result.fromMap(Map<String, dynamic> map) {
    final factory = TypedResult.factory;

    return Result(
      details: factory.readDetails(map),
      status: factory.readStatus(map),
      message: factory.readMessage(map),
      data: factory.readData(map),
    );
  }
  static Result clone<TData, TInput>(IResult origin) => Result(
        message: origin.message,
        status: origin.status,
        details: origin.details,
      );
}
