import 'package:flutter/material.dart';
import 'package:flutter_project/Duyurular/home.dart';

void main() {
  runApp(Duyuru());
}

class Duyuru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
