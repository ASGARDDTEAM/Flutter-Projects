import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<String> tweets = [];
  final tweetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: tweets.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(tweets[index]),
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
                  onFieldSubmitted: (tweet) {
                    setState(() {
                      tweets.add(tweet);
                      tweetController.clear();
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  setState(() {
                    tweets.add(tweetController.text);
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}