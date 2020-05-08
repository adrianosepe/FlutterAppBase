import 'dart:convert';

import 'package:app_base/ex_json.dart';

class DateRange {
  final DateTime begin;
  final DateTime end;

  DateRange(this.begin, this.end);

  DateRange copyWith({
	  DateTime begin,
	  DateTime end,
  }) {
    return DateRange(
      begin ?? this.begin,
      end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Start': ExJson.toMap(begin?.toUtc()),
      'End': ExJson.toMap(end?.toUtc()),
    };
  }

  static DateRange fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return DateRange(
      ExJson.fromMap(map['Start'])?.toLocal(),
      ExJson.fromMap(map['End'])?.toLocal(),
    );
  }

  String toJson() => json.encode(toMap());

  static DateRange fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Interval(Start: $begin, End: $end)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is DateRange &&
      o.begin == begin &&
      o.end == end;
  }

  @override
  int get hashCode => begin.hashCode ^ end.hashCode;
}