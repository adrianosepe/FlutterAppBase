part of fab_lib;

class ResultInfo {
  final String? key;
  final String message;

  ResultInfo({
    this.key,
    required this.message,
  });

  ResultInfo copyWith({
    String? key,
    String? message,
  }) {
    return ResultInfo(
      key: key ?? this.key,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'message': message,
    };
  }

  factory ResultInfo.fromMap(Map<String, dynamic> map) {
    return ResultInfo(
      key: map['key'] ?? XString.empty,
      message: map['message'] ?? XString.empty,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultInfo.fromJson(String source) => ResultInfo.fromMap(json.decode(source));

  @override
  String toString() => 'ResultInfo(key: $key, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResultInfo && other.key == key && other.message == message;
  }

  @override
  int get hashCode => key.hashCode ^ message.hashCode;
}
