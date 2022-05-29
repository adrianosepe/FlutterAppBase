part of fab_lib;

abstract class ResultFactory {
  List<ResultInfo>? readDetails(Map<String, dynamic> map);

  EResultStatus readStatus(Map<String, dynamic> map);

  String? readMessage(Map<String, dynamic> map);

  Object? readData(Map<String, dynamic> map);
}
