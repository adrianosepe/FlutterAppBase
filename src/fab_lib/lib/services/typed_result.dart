part of fab_lib;

class TypedResult<TData> extends IResult {
  final TData? data;
  final List<ResultInfo>? details;
  final EResultStatus status;
  final String? message;

  static ResultFactory factory = GrappTecResultFactory();

  bool get ok => status == EResultStatus.Ok;
  bool get nok => !ok;

  TypedResult({
    this.data,
    this.details,
    required this.status,
    this.message,
  });

  TypedResult<TData> copyWith({
    TData? data,
    List<ResultInfo>? details,
    EResultStatus? status,
    String? message,
  }) {
    return TypedResult<TData>(
      data: data ?? this.data,
      details: details ?? this.details,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  static TypedResult<List<TData>> fromList<TData>(Map<String, dynamic> map, Func1<List<dynamic>, List<TData>> converter) {
    return TypedResult<List<TData>>(
      data: map['data'] is List ? converter(map['data']) : null,
      details: factory.readDetails(map),
      status: factory.readStatus(map),
      message: factory.readMessage(map),
    );
  }

  factory TypedResult.fromMap(Map<String, dynamic> map, Func1<Map<String, dynamic>, TData> converter) {
    return TypedResult<TData>(
      data: map['data'] != null ? converter(map['data']) : null,
      details: factory.readDetails(map),
      status: factory.readStatus(map),
      message: factory.readMessage(map),
    );
  }

  factory TypedResult.fromJson(String source, Func1<Map<String, dynamic>, TData> converter) => TypedResult.fromMap(json.decode(source), converter);

  @override
  String toString() {
    return 'TypedResult(data: $data, details: $details, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypedResult<TData> && other.data == data && listEquals(other.details, details) && other.status == status && other.message == message;
  }

  @override
  int get hashCode {
    return data.hashCode ^ details.hashCode ^ status.hashCode ^ message.hashCode;
  }

  static TypedResult<TData> clone<TData, TInput>(TypedResult<TInput> origin, {TData? data}) => TypedResult<TData>(
        message: origin.message,
        status: origin.status,
        details: origin.details,
        data: data,
      );

  static TypedResult<TData> error<TData>(String error, {List<ResultInfo>? details}) => TypedResult<TData>(
        message: error,
        status: EResultStatus.Error,
        details: details,
      );

  static TypedResult<TData> exception<TData>(Exception ex) => error(ex.toString());

  static TypedResult<TData> success<TData>({TData? data, String? message}) => TypedResult<TData>(
        data: data,
        message: message,
        status: EResultStatus.Ok,
      );

  static TypedResult<TData> warning<TData>(String alert) => TypedResult<TData>(
        message: alert,
        status: EResultStatus.Warning,
      );
}
