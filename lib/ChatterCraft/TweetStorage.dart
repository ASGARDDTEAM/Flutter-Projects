import 'dart:convert';
import 'dart:io';

class TweetStorage {
  static const String fileName = 'tweets.json';

  static Future<List<String>> getTweets() async {
    try {
      File file = File(fileName);
      if (await file.exists()) {
        String content = await file.readAsString();
        List<dynamic> jsonList = jsonDecode(content);
        return jsonList.map((e) => e.toString()).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error reading file: $e');
      return [];
    }
  }

  static Future<void> addTweet(String tweet) async {
    try {
      List<String> tweets = await getTweets();
      tweets.add(tweet);

      File file = File(fileName);
      await file.writeAsString(jsonEncode(tweets));
    } catch (e) {
      print('Error writing file: $e');
    }
  }
}