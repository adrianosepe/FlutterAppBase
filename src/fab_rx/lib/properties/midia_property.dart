part of fab_rx;

class ImageProperty extends Property<String> {
  static const imageBase64 = 'data:image/png;base64';

  ImageProperty({
    String? label,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
  }) : super(
          label: label,
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

    setter('$imageBase64, $img64');
  }
}
