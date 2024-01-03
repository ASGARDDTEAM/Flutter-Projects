
import 'package:flutter/material.dart';
import 'package:flutter_project/main/homepage.dart';
import 'package:lottie/lottie.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Widget oluşturulduğunda 3 saniyelik bir gecikme ekleyerek animasyonu başlat
    Future.delayed(Duration(seconds: 0), () async {
      await _controller.forward();

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [
               Color.fromARGB(255, 8, 3, 57),
               Color.fromARGB(255, 137, 106, 148),                
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              if (bookmarked == false) {
                bookmarked = true;
                _controller.forward();
              } else {
                bookmarked = false;
                _controller.reverse();
              }
            },
            child: Container(
              child: LottieBuilder.asset(
                'images/animasyon5.json',
                controller: _controller,
                width: 1000.0,
                height: 1000.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
