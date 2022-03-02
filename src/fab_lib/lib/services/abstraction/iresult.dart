part of fab_lib;

abstract class IResult {
  abstract final List<ResultInfo>? details;
  abstract final EResultStatus status;
  abstract final String? message;
  abstract final bool ok;
}
