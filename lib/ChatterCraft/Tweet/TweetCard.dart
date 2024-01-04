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
            Row(
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 40.0,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    tweet.text,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
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
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(225, 229, 150, 1),
                      Color.fromRGBO(97, 169, 251, 1),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.quickreply),
                    color: Color.fromRGBO(42, 40, 162, 1),
                    onPressed: onReplyPressed,
                  ),
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
                      style: TextStyle(color: Color.fromRGBO(42, 40, 162, 1), fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      for (var comment in tweet.comments)
                        ListTile(
                          leading: Icon(
                            Icons.account_circle,
                            color: Color.fromRGBO(99, 96, 229, 1),
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
