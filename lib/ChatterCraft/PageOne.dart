import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/Tweet.dart';
import 'package:flutter_project/ChatterCraft/filetransaction.dart';

class PageOne extends StatefulWidget {
  final List<Tweet> tweets;
  final Function(Tweet) onTweetSubmitted;

  PageOne({required this.tweets, required this.onTweetSubmitted, required Null Function(dynamic tweet) onLikePressed});

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final TextEditingController tweetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String path = "C:\\Users\\Senaa\\Desktop\\Flutter-project\\GitProject\\flutter_project\\lib\\ChatterCraft\\texts\\HomeTexts.txt";
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
        },
        onTweetSubmitted: (newTweet) {
          widget.onTweetSubmitted(newTweet);
        },
      ),
    );
  }
}
