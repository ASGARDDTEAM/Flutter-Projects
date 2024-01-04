import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/Tweet/Tweet.dart';
import 'package:flutter_project/ChatterCraft/File/DosyaIslem.dart';

import '../Tweet/TweetCard.dart';

// ignore: must_be_immutable
class FileTransaction extends StatefulWidget {
  List<Tweet> tweets;
  Function(Tweet) onTweetSubmitted;
  String path;
  FileTransaction({required this.path, required this.tweets, required this.onTweetSubmitted, required Null Function(dynamic tweet) onLikePressed});

  @override
  State<FileTransaction> createState() => _FiletransactionState();
}

class _FiletransactionState extends State<FileTransaction> {
  final TextEditingController tweetController = TextEditingController();
  final TextEditingController commentTextController = TextEditingController();
  String fixedPath = "C:\\Users\\Senaa\\Desktop\\Flutter-project\\GitProject\\flutter_project\\lib\\ChatterCraft\\texts\\HomeTexts.txt";

  void saveTweetsToFile(String path, List tweets) {
    DosyaIslemleri.writeTweetsToFile(path, widget.tweets);
  }

  void addTweet(String fixedPath, List tweets) {
    DosyaIslemleri.addTweetToFile(fixedPath, tweets.last);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.tweets.length,
            itemBuilder: (context, index) {
              final tersindex = widget.tweets.length - index - 1;
              return TweetCard(
                tweet: widget.tweets[tersindex],
                onLikePressed: () {
                  setState(() {
                    widget.tweets[tersindex].toggleLike();
                    saveTweetsToFile(widget.path, widget.tweets);
                    addTweet(fixedPath, widget.tweets);
                  });
                },
                onReplyPressed: () {
                  showCommentDialog(context, widget.tweets[tersindex]);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: tweetController,
                  decoration: InputDecoration(
                    hintText: 'Yine Ne Soruyosun..?',
                  ),
                  onFieldSubmitted: (tweetText) {
                    final newTweet = Tweet(text: tweetText);
                    widget.onTweetSubmitted(newTweet);
                    tweetController.clear();
                    saveTweetsToFile(widget.path, widget.tweets);
                    addTweet(fixedPath, widget.tweets);
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  final newTweet = Tweet(text: tweetController.text);
                  widget.onTweetSubmitted(newTweet);
                  tweetController.clear();
                  saveTweetsToFile(widget.path, widget.tweets);
                  addTweet(fixedPath, widget.tweets);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showCommentDialog(BuildContext context, Tweet tweet) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Yorum Ekle"),
        content: TextField(
          controller: commentTextController,
          decoration: InputDecoration(hintText: "Fikrini yazz.."),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              commentTextController.clear();
            },
            child: Text("İptal"),
          ),
          TextButton(
            onPressed: () {
              addComment(tweet, commentTextController.text);
              Navigator.pop(context);
              commentTextController.clear();
            },
            child: Text("Ekle"),
          ),
        ],
      ),
    );
  }

  void addComment(Tweet tweet, String commentText) {
    setState(() {
      tweet.addComment(commentText);
      saveTweetsToFile(widget.path, widget.tweets);
      addTweet(fixedPath, widget.tweets);
    });
  }
}
