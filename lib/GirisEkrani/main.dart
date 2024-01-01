import 'package:flutter/material.dart';
import 'package:flutter_project/GirisEkrani/login_page.dart';


void main() {
  runApp(const Sign());
}

class Sign extends StatelessWidget {
  const Sign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
