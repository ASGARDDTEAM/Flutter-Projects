import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/home_view.dart';

import 'PageOne.dart';
import 'Tweet.dart';

class TagPage extends StatefulWidget {
  late final List<Tweet> tweets;
  late final Function(Tweet) onTweetSubmitted;

  TagPage({required this.tweets, required this.onTweetSubmitted});
  State<TagPage> createState() => _TagPage();
}

class _TagPage extends State<TagPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(73, 255, 255, 255),
      ),
      body: PageOne(
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
