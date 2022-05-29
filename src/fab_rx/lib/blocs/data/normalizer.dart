part of fab_rx;

class DataNormalizer {
  static String removePunctuation(String? o) {
    if (XString.isNullOrEmpty(o)) {
      return XString.empty;
    }

    final original = o!;

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
