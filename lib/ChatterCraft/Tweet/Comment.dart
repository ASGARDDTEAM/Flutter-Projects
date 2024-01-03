import 'package:flutter/material.dart';

import 'Tweet.dart';

class CommentSection extends StatelessWidget {
  final Tweet tweet;

  CommentSection({required this.tweet});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Yorumlar'),
      children: [
        Column(
          children: [
            ListView.builder(
              itemCount: tweet.comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tweet.comments[index]),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
