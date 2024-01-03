import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Duyurular/models/liste_model.dart';
import 'package:flutter_project/Duyurular/second_page_home.dart';
import 'package:flutter_project/main/homepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_project/Duyurular/models/liste.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  List<News> liste = listem.newsList;

  @override
  void initState() {
    super.initState();
    _loadCount();
  }

  Future<void> _loadCount() async {
    List<int> tapCounts = await filefunctions.readTapCountsFromFile(
      r"C:\Users\PC\Desktop\workonnnsonn\flutter_application_1\lib\file\tapCountfile.txt",
    );

    setState(() {
      for (int i = 0; i < tapCounts.length; i++) {
        liste[i].tapCount = tapCounts[i];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Flutter"),
              Text(
                "News",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          ),
          Column(
            children: [
              CarouselSlider.builder(
                itemCount: liste.length,
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondHomePage(
                            shpage: liste[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              liste[index].image,
                              height: double.maxFinite,
                              fit: BoxFit.cover,
                              width: double.maxFinite,
                            ),
                          ),
                          Container(
                            height: 220,
                            padding: const EdgeInsets.only(left: 10.0),
                            margin: const EdgeInsets.only(top: 170.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(70, 73, 73, 0.0),
                                  Color.fromRGBO(70, 73, 73, 0.7),
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                liste[index].title,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: liste.length,
                    effect: const ScrollingDotsEffect(
                      dotWidth: 15,
                      dotHeight: 15,
                      activeDotColor: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Text(
              "Trend Haberler",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: liste.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(liste[index].title),
                    subtitle: Row(
                      children: [
                        Text('${liste[index].year} - '),
                        Text(' ${liste[index].tapCount} '),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 4.0), // Adjust the padding as needed
                          child: Icon(
                            Icons.visibility,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    leading: Image.asset(liste[index].image),
                    onTap: () {
                      setState(() {
                        liste[index].tapCount++;
                      });
                      filefunctions.writeTapCountsToFile(
                        r"C:\Users\PC\Desktop\workonnnsonn\flutter_application_1\lib\file\tapCountfile.txt",
                        listem.newsList,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondHomePage(
                            shpage: liste[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
