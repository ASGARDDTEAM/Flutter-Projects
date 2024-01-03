
import 'package:flutter/material.dart';
import 'package:flutter_project/main/Animation_continue.dart';


void main(){
  runApp(const MainPage());
}
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationPage(),
    );
  }
}
