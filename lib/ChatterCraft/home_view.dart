import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/Page/PageOne.dart';
import 'package:flutter_project/ChatterCraft/Page/PageTwo.dart';
import 'package:flutter_project/ChatterCraft/Tweet/Tweet.dart';
import 'package:flutter_project/ChatterCraft/File/DosyaIslem.dart';
import 'package:flutter_project/main/homepage.dart';

void main() => runApp(Twitthor());

class Twitthor extends StatefulWidget {
  @override
  _TwitthorState createState() => _TwitthorState();
}

class _TwitthorState extends State<Twitthor> {
  List<Tweet> tweets = [];

  @override
  void initState() {
    super.initState();
    _loadTweetsFromFile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(97, 169, 251, 1),
        body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(225, 229, 150, 1),
                      Color.fromRGBO(97, 169, 251, 1),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    title: Text(
                      "T W I T H O R",
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.8), fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
                TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.home)),
                    Tab(
                      icon: Icon(Icons.flash_on),
                    ),
                  ],
                  labelColor: Color.fromRGBO(42, 40, 162, 1),
                  indicatorColor: Color.fromRGBO(8, 12, 76, 1),
                  indicatorWeight: 3.0,
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      PageOne(
                        tweets: tweets,
                        onTweetSubmitted: (Tweet tweet) {
                          setState(() {
                            tweets.add(tweet);
                          });
                        },
                        onLikePressed: (tweet) {},
                      ),
                      PageTwo(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loadTweetsFromFile() async {
    List<Tweet> loadedTweets = await DosyaIslemleri.readTweetsFromFile("C:\\Users\\MSI\\Desktop\\Flutter-Projects-main\\Flutter-Projects\\lib\\ChatterCraft\\texts\\HomeTexts.txt");

    setState(() {
      tweets.clear();
      tweets.addAll(loadedTweets);
    });
  }
}
