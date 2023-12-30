import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'homepage.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Widget oluşturulduğunda 3 saniyelik bir gecikme ekleyerek animasyonu başlat
    Future.delayed(Duration(seconds: 1), () async {
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
      backgroundColor: Color.fromARGB(23, 0, 0, 0),
      body: Center(
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
            // width: double.infinity,
            // height: double.infinity,
            child: LottieBuilder.asset(
              'images/animasyon5.json',
              controller: _controller,
              width: 100000.0,
              height: 1000.0,
              //  width: MediaQuery.of(context).size.width,
              //  height: MediaQuery.of(context).size.height,
              // fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
