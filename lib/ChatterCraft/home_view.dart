import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/PageOne.dart';
import 'package:flutter_project/ChatterCraft/PageTwo.dart';
import 'package:flutter_project/ChatterCraft/Tweet.dart';
import 'package:flutter_project/ChatterCraft/DosyaIslem.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Tweet> tweets = [];

  @override
  void initState() {
    super.initState();
    _loadTweetsFromFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                child: AppBar(
                  title: Text("C H A T T E R C R A F T"),
                  centerTitle: true,
                  backgroundColor: Color.fromRGBO(97, 169, 251, 1.0),
                ),
                height: 50,
              ),
              TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.home)),
                  Tab(
                    icon: Icon(Icons.flash_on),
                  ),
                ],
                labelColor: Color.fromRGBO(97, 169, 251, 1.0),
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
    );
  }

  void _loadTweetsFromFile() async {
    tweets = await DosyaIslemleri.readTweetsFromFile("C:\\Users\\MSI\\Desktop\\Flutter-Projects-main\\Flutter-Projects\\lib\\ChatterCraft\\texts\\HomeTexts.txt");
    setState(() {});
  }
}
