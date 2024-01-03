import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final bool Function() onTap;

  const MyButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 25),

      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal:5),
          decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [
        Color.fromRGBO(197, 154, 250, 1),
        Color.fromRGBO(147, 195,249, 1.0)
        ],
          stops: [0.0,1.0],
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8.0),
      ),
        child: Center(
          child: Text(
            'Giriş Yap',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),),
    );
  }
}

// Yeni sayfaya bağlanmak için.
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İkinci Sayfa'),
      ),
      body: Center(
        child: Text('Merhaba, Bu İkinci Sayfa!'),
      ),
    );
  }
}
