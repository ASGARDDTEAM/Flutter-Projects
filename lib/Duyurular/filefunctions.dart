import 'dart:io';
import 'package:flutter_application_1/models/liste_model.dart';

class filefunctions {
  static Future<void> writeTapCountsToFile(
      String filePath, List<News> newsList) async {
    final file = File(filePath);
    String content = newsList.map((news) {
      return '${news.tapCount}';
    }).join('\n');
    await file.writeAsString(content);
  }

  static Future<List<int>> readTapCountsFromFile(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) {
      return [];
    }

    String fileContent = await file.readAsString();
    return fileContent.split("\n").where((line) => line.isNotEmpty).map((line) {
      return int.tryParse(line) ?? 0;
    }).toList();
  }
}
