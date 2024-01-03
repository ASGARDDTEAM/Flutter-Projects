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

  @override
  Widget build(BuildContext context) {
    void saveTweetsToFile(String path, List tweets) {
      DosyaIslemleri.writeTweetsToFile(path, widget.tweets);
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.tweets.length,
            itemBuilder: (context, index) {
              return TweetCard(
                tweet: widget.tweets[index],
                onLikePressed: () {
                  setState(() {
                    widget.tweets[index].toggleLike();
                    saveTweetsToFile(widget.path, widget.tweets);
                  });
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
                    hintText: 'What\'s happening?',
                  ),
                  onFieldSubmitted: (tweetText) {
                    final newTweet = Tweet(text: tweetText);
                    widget.onTweetSubmitted(newTweet);
                    tweetController.clear();
                    saveTweetsToFile(widget.path, widget.tweets);
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
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
