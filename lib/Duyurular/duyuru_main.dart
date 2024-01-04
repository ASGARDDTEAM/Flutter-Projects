import 'package:flutter/material.dart';
import 'package:flutter_project/Duyurular/home.dart';


void main() {
  runApp(Duyurular());
}

class Duyurular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home());
  }
}
