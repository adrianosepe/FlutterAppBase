import 'dart:io';

import 'package:path_provider/path_provider.dart';

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
