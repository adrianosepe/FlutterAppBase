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
        status: EResultStatus.Error,
        details: details,
        message: error,
      );

  static Result exception(Exception ex) => error(ex.toString());

  static Result success({Object? data, String? nessage}) => Result(status: EResultStatus.Ok, message: nessage, data: data);

  static Result warning(String alert) => Result(status: EResultStatus.Warning, message: alert);

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      details: map['details'] != null ? List<ResultInfo>.from(map['details']?.map((x) => ResultInfo.fromMap(x))) : null,
      status: XEnum.fromMap(map['status']!.toInt(), EResultStatus.values)!,
      message: map['message'],
    );
  }
}
