import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/Tweet/Tweet.dart';
import 'package:flutter_project/ChatterCraft/File/filetransaction.dart';
import '../File/DosyaIslem.dart';

class PageOne extends StatefulWidget {
  final List<Tweet> tweets;
  final Function(Tweet) onTweetSubmitted;

  PageOne({required this.tweets, required this.onTweetSubmitted, required Null Function(dynamic tweet) onLikePressed});

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final TextEditingController tweetController = TextEditingController();
  String path = "C:\\Users\\Senaa\\Desktop\\Flutter-project\\GitProject\\flutter_project\\lib\\ChatterCraft\\texts\\HomeTexts.txt";

  @override
  void initState() {
    super.initState();
    _loadTweets();
  }

  Future<void> _loadTweets() async {
    List<Tweet> loadedTweets = await DosyaIslemleri.readTweetsFromFile(path);

    setState(() {
      widget.tweets.clear();
      widget.tweets.addAll(loadedTweets);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(73, 255, 255, 255),
      ),
      body: FileTransaction(
        path: path,
        tweets: widget.tweets,
        onLikePressed: (tweet) {
          setState(() {
            tweet.toggleLike();
          });

          List<Tweet> updatedTweets = DosyaIslemleri.readTweetsFromFile(path) as List<Tweet>;

          setState(() {
            widget.tweets.clear();
            widget.tweets.addAll(updatedTweets);
          });

          DosyaIslemleri.writeTweetsToFile(path, widget.tweets);
        },
        onTweetSubmitted: (newTweet) async {
          widget.onTweetSubmitted(newTweet);

          List<Tweet> updatedTweets = await DosyaIslemleri.readTweetsFromFile(path);

          setState(() {
            widget.tweets.clear();
            widget.tweets.addAll(updatedTweets);
          });

          await DosyaIslemleri.writeTweetsToFile(path, widget.tweets);
        },
      ),
    );
  }
}
