import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Tweet.dart';

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
