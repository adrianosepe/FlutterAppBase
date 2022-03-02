part of fab_rx;

class ImageProperty extends Property<String> {
  static const image_base64 = 'data:image/png;base64';

  ImageProperty({
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
  }) : super(
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
        );

  Uint8List? read() {
    if (!exists()) {
      return null;
    }

    return base64.decode(value!.substring(value!.indexOf(',') + 1));
  }

  void write(Uint8List bytes) {
    String img64 = base64Encode(bytes);

    setter('$image_base64, $img64');
  }
}
