part of fab_rx;

class DataNormalizer {
  static String removePunctuation(String original) {
    if (XString.isNullOrEmpty(original)) {
      return XString.empty;
    }

    return original
        .replaceAll(
          '.',
          XString.empty,
        )
        .replaceAll(
          '-',
          XString.empty,
        )
        .replaceAll(
          '|',
          XString.empty,
        )
        .replaceAll(
          '/',
          XString.empty,
        )
        .replaceAll(
          '=',
          XString.empty,
        );
  }
}
