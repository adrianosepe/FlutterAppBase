import 'package:fab_lib/fab_lib.dart';

class GrappTecResultFactory extends ResultFactory {
  List<ResultInfo>? readDetails(Map<String, dynamic> map) {
    return map['details'] != null ? List<ResultInfo>.from(map['details']?.map((x) => ResultInfo.fromMap(x))) : null;
  }

  @override
  EResultStatus readStatus(Map<String, dynamic> map) {
    return XEnum.fromMap(map['status']!.toInt(), EResultStatus.values)!;
  }

  @override
  String? readMessage(Map<String, dynamic> map) {
    return map['message'];
  }

  @override
  Object? readData(Map<String, dynamic> map) {
    return map['data'];
  }
}
