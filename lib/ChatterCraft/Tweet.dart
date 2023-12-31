import 'package:flutter/material.dart';


class Tweet {
  final String text;
  int likes = 0;
  bool isLiked = false;

  Tweet({required this.text,
        this.likes = 0, 
        this.isLiked = false});

  void toggleLike() {
    isLiked = !isLiked;
    if (isLiked) {
      likes++;
    } else {
      likes--;
    }
  }
}