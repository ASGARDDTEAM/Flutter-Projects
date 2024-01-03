import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/File/filetransaction.dart';
import 'package:flutter_project/ChatterCraft/Listpage/pathllist.dart';
import '../File/DosyaIslem.dart';
import '../Tweet/Tweet.dart';

// ignore: must_be_immutable
class TagPage extends StatefulWidget {
  final List<Tweet> tweets;
  final Function(Tweet) onTweetSubmitted;
  final int index;
  String path;

  TagPage({
    required this.path,
    required this.index,
    required this.tweets,
    required this.onTweetSubmitted,
  });

  @override
  State<TagPage> createState() => _TagPage();
}

class _TagPage extends State<TagPage> {
  @override
  void initState() {
    super.initState();
    _loadTweets();
  }

  Future<void> _loadTweets() async {
    List<Tweet> loadedTweets = await DosyaIslemleri.readTweetsFromFile(PathList().list2[widget.index]);

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
          path: PathList().list2[widget.index],
          tweets: widget.tweets,
          onLikePressed: (tweet) {
            tweet.toggleLike();

            List<Tweet> updatedTweets = DosyaIslemleri.readTweetsFromFile(PathList().list2[widget.index]) as List<Tweet>;
            setState(() {
              widget.tweets.clear();
              widget.tweets.addAll(updatedTweets);
            });

            DosyaIslemleri.writeTweetsToFile(PathList().list2[widget.index], widget.tweets).then((_) {});
          },
          onTweetSubmitted: (newTweet) async {
            widget.onTweetSubmitted(newTweet);

            List<Tweet> updatedTweets = await DosyaIslemleri.readTweetsFromFile(PathList().list2[widget.index]);

            setState(() {
              widget.tweets.clear();
              widget.tweets.addAll(updatedTweets);
            });

            await DosyaIslemleri.writeTweetsToFile(PathList().list2[widget.index], widget.tweets).then((_) {});
          }),
    );
  }
}
