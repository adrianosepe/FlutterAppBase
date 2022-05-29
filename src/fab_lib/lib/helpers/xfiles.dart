part of fab_lib;

class XFiles {
  static Future<Uint8List> readAsByteList(String filePath) async {
    final uri = Uri.parse(filePath);
    final file = File.fromUri(uri);

    return await file.readAsBytes();
  }

  static Future<String> readAsStringBase64(String filePath) async {
    final bytes = await readAsByteList(filePath);

    return base64Encode(bytes);
  }
}
