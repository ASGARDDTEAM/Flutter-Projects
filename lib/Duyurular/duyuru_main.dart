import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(Duyurular());
}

class Duyurular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}
