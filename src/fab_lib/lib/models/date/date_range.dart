part of fab_lib;

class DateRange {
  final DateTime? begin;
  final DateTime? end;

  DateRange({this.begin, this.end});

  DateRange copyWith({
    DateTime? begin,
    DateTime? end,
  }) {
    return DateRange(
      begin: begin ?? this.begin,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Start': XJson.toMap(begin?.toUtc()),
      'End': XJson.toMap(end?.toUtc()),
    };
  }

  static DateRange? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return DateRange(
      begin: XJson.fromMap(map['Start'])?.toLocal(),
      end: XJson.fromMap(map['End'])?.toLocal(),
    );
  }

  String toJson() => json.encode(toMap());

  static DateRange? fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Interval(Start: $begin, End: $end)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DateRange && other.begin == begin && other.end == end;
  }

  @override
  int get hashCode => begin.hashCode ^ end.hashCode;
}
