class Tweet {
  final String text;
  int likes = 0;
  bool isLiked = false;
  List<String> comments;

  Tweet({
    required this.text,
    this.likes = 0,
    this.isLiked = false,
    this.comments = const [],
  });

  void toggleLike() {
    isLiked = !isLiked;
    if (isLiked) {
      likes++;
    } else {
      likes--;
    }
  }

  void addComment(String comment) {
    comments.add(comment);
  }
}
