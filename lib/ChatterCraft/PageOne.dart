import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PageOne extends StatefulWidget {
  final List<Tweet> tweets;
  final Function(Tweet) onTweetSubmitted;

  PageOne({required this.tweets, required this.onTweetSubmitted});

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final TextEditingController tweetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  final newTweet = Tweet(text: tweetController.text);
                  widget.onTweetSubmitted(newTweet);
                  tweetController.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Tweet {
  final String text;
  int likes = 0;
  bool isLiked = false;

  Tweet({required this.text});

  void toggleLike() {
    isLiked = !isLiked;
    if (isLiked) {
      likes++;
    } else {
      likes--;
    }
  }
}

class TweetCard extends StatelessWidget {
  final Tweet tweet;
  final VoidCallback onLikePressed;

  TweetCard({required this.tweet, required this.onLikePressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tweet.text),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        tweet.isLiked ? Icons.favorite : Icons.favorite_border,
                        color: tweet.isLiked ? Colors.red : null,
                      ),
                      onPressed: onLikePressed,
                    ),
                    Text('${tweet.likes} Likes'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}