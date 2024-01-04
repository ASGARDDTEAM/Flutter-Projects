// ignore_for_file: avoid_unnecessary_containers
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/ChatterCraft.dart';
import 'package:flutter_project/Duyurular/duyuru_main.dart';
import 'package:flutter_project/GirisSayfasi/main.dart';
import 'package:flutter_project/Gossip/animasyon.dart';
import 'package:flutter_project/KaynakMerkezi/kaynak.dart';
import 'package:flutter_project/Topluluklar/topluluk.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'images/feng.jpg',
    'images/ıam.jpg',
    'images/helloworld.jpg',
    'images/codegirl.jpg',
    'images/yemekhane.png',
    'images/touch.jpg',
  ];
  void _launchURL() async {
    String url = 'https://www.trakya.edu.tr/yemeklistesi';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Color.fromRGBO(246, 234, 250, 1),
      appBar: AppBar(

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 8, 3, 57),
                Color.fromARGB(255, 137, 106, 148),
              ],
              stops: [
                0.0,
                1.0
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [
                Color.fromRGBO(197, 154, 250, 1),
                Color.fromRGBO(147, 195, 249, 1.0)
              ],
              stops: [
                0.0,
                1.0
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: Text(
            'thor',
            style: GoogleFonts.silkscreen(
              textStyle: TextStyle(
                color: Color.fromARGB(255, 238, 224, 240),
                fontWeight: FontWeight.normal,
                fontSize: 50.0,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 8, 3, 57),
                Color.fromARGB(255, 137, 106, 148),
              ],
              stops: [
                0.0,
                1.0
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 50.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Chris Hemsworth',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        'Bilgisayar Mühendisliği',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        '3.Sınıf',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.newspaper,
                  color: Colors.white,
                ),
                title: const Text(
                  'News',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Duyurular()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.alternate_email,
                  color: Colors.white,
                ),
                title: const Text(
                  'Twitter',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatterApp()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                title: const Text(
                  'Gossip',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SplashPage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                title: Text(
                  'Comminity',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ToplulukMerkezi()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_balance,
                  color: Colors.white,
                ),
                title: const Text(
                  'Kaynak Merkezi',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => KaynakMerkezi()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.privacy_tip,
                  color: Colors.white,
                ),
                title: const Text(
                  'Privacy',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
               
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                title: const Text(
                  'LOGOUT',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Sign()));
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        if (image == 'images/yemekhane.png') {
                          _launchURL();
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 200.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  if (reason == CarouselPageChangedReason.manual) {
                    print("Manually changed to page $index");
                  } else if (reason == CarouselPageChangedReason.controller) {
                    print("Controller changed to page $index");
                  }
                },
              ),
            ),
            SizedBox(height: 16),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 19,
                mainAxisSpacing: 19,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                IconData iconData;
                String labelText;

                switch (index) {
                  //burası yuvarlak kutuların icon yeri
                  case 0:
                    iconData = Icons.newspaper;
                    labelText = 'NEWS';

                    break;
                  case 1:
                    iconData = Icons.alternate_email;
                    labelText = 'TWİTTER';
                    break;
                  case 2:
                    iconData = Icons.lock;
                    labelText = 'GOSSİP';
                    break;
                  case 3:
                    iconData = Icons.people;
                    labelText = 'COMMİNİTY';
                    break;
                  case 4:
                    iconData = Icons.account_balance;
                    labelText = 'KAYNAK';
                    break;
                  case 5:
                    iconData = Icons.settings;
                    labelText = 'SETTİNGS';
                    break;
                  default:
                    iconData = Icons.error;
                    labelText = 'default';
                    break;
                }

                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      //alttaki yukarlakların gideceği yeri belirler
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Duyurular()),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatterApp()),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SplashPage()),
                        );
                        break;
                      case 3:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ToplulukMerkezi()),
                        );
                        break;
                      case 4:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KaynakMerkezi()),
                        );
                        break;
                    }
                  },
                  child: Card(
                    color: Color.fromARGB(129, 236, 193, 239),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          iconData,
                          color: Color.fromRGBO(97, 76, 122, 1),
                          size: 60,
                        ),
                        SizedBox(height: 8),
                        Text(
                          labelText,
                          style: TextStyle(
                            color: Color.fromRGBO(97, 76, 122, 1),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        //alttaki bar için
        height: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 3, 57),
              Color.fromARGB(255, 137, 106, 148),
            ],
            stops: [
              0.0,
              1.0
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
          child: GNav(
            color: Color.fromARGB(255, 255, 255, 255),
            activeColor: Color.fromARGB(255, 246, 186, 255),
            tabBackgroundColor: Color.fromARGB(255, 54, 54, 54),
            gap: 1,
            padding: EdgeInsets.all(15),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'HOME',
              ),
              GButton(
                  icon: Icons.fastfood_sharp,
                  text: 'YEMEKHANE',
                  onPressed: () async {
                   String url = 'https://www.trakya.edu.tr/yemeklistesi';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }),
              GButton(
                  icon: Icons.radio,
                  text: 'RADYO',
                  onPressed: () async {
                    String url = 'http://radyogunebakancanli.trakya.edu.tr/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }),
            ],
          ),
        ),
      ),
    );
    return scaffold;
  }
}
