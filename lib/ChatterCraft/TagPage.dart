import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/filetransaction.dart';
import 'package:flutter_project/ChatterCraft/pathllist.dart';
import 'DosyaIslem.dart';
import 'Tweet.dart';

// ignore: must_be_immutable
class TagPage extends StatefulWidget {
  final List<Tweet> tweets;
  final Function(Tweet) onTweetSubmitted;
  int index;
  String path;

  TagPage({required this.path, required this.index, required this.tweets, required this.onTweetSubmitted});
  State<TagPage> createState() => _TagPage();
}

class _TagPage extends State<TagPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(73, 255, 255, 255),
      ),
      body: FileTransaction(
        path: PathList().list2[widget.index],
        tweets: widget.tweets,
        onLikePressed: (tweet) {
          Future<List<Tweet>> updatedTweets = DosyaIslemleri.readTweetsFromFile(PathList().list2[widget.index]);

          setState(() {
            widget.tweets.clear();
            widget.tweets.addAll(updatedTweets as Iterable<Tweet>);
          });
          tweet.toggleLike();
          DosyaIslemleri.writeTweetsToFile(PathList().list2[widget.index], widget.tweets);
        },
        onTweetSubmitted: (newTweet) {
          setState(() {
            widget.onTweetSubmitted(newTweet);
            var sonuc = DosyaIslemleri.readTweetsFromFile(PathList().list2[widget.index]);
          });
        },
      ),
    );
  }
}
