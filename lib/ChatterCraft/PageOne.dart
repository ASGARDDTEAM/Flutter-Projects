import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/Tweet.dart';
import 'package:flutter_project/ChatterCraft/filetransaction.dart';

class PageOne extends StatefulWidget {
  final List<Tweet> tweets;
  final Function(Tweet) onTweetSubmitted;

  PageOne({required this.tweets, required this.onTweetSubmitted, required Null Function(dynamic tweet) onLikePressed});

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final TextEditingController tweetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    String path = "C:\\Users\\Senaa\\Desktop\\Flutter-project\\GitProject\\flutter_project\\lib\\ChatterCraft\\texts\\HomeTexts.txt";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(73, 255, 255, 255),
      ),
      body: FileTransaction(
        path: path,
        tweets: widget.tweets,
        onLikePressed: (tweet) {
          setState(() {
            tweet.toggleLike();
          });
        },
        onTweetSubmitted: (newTweet) {
          widget.onTweetSubmitted(newTweet);
        },
=======
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
                    _saveTweetsToFile();
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
                    _saveTweetsToFile();
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  final newTweet = Tweet(text: tweetController.text);
                  widget.onTweetSubmitted(newTweet);
                  tweetController.clear();
                  _saveTweetsToFile();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _saveTweetsToFile() {
    DosyaIslemleri.writeTweetsToFile("C:\\Users\\MSI\\Desktop\\Flutter-Projects-main\\Flutter-Projects\\lib\\ChatterCraft\\texts\\HomeTexts.txt", widget.tweets);
  }
}

class TweetCard extends StatelessWidget {
  final Tweet tweet;
  final VoidCallback onLikePressed;

  TweetCard({required this.tweet, required this.onLikePressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8.0),
      leading: Icon(
        Icons.account_box,
        color: Colors.grey,
      ),
      title: Text(tweet.text),
      subtitle: Row(
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
>>>>>>> 87523c837419c0cba277f8b18ef7abd11e34e8fe
      ),
    );
  }
}
