part of fab_lib;

class XImage {
  static Future<String> saveAsTemporaryFile(List<int> content) async {
    final p = await getTemporaryDirectory();
    final name = "${DateTime.now()}.png";
    final path = "${p.path}/$name";

    final file = File(path);
    await file.writeAsBytes(content);

    return path;
  }
}
