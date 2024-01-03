import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Tweet.dart';

class TweetCard extends StatelessWidget {
  final Tweet tweet;
  final VoidCallback onLikePressed;
  final VoidCallback onReplyPressed;

  TweetCard({required this.tweet, required this.onLikePressed, required this.onReplyPressed});

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
                IconButton(
                  icon: Icon(Icons.quickreply),
                  color: Color.fromARGB(255, 109, 40, 169),
                  onPressed: onReplyPressed,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            if (tweet.comments.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpansionTile(
                    backgroundColor: const Color.fromRGBO(221, 223, 253, 1.0),
                    title: Text(
                      'Yorumlar',
                      style: TextStyle(color: Color.fromARGB(255, 130, 57, 208), fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      for (var comment in tweet.comments)
                        ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            color: Color.fromARGB(255, 130, 57, 208),
                          ),
                          title: Text(
                            comment,
                          ),
                        ),
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
