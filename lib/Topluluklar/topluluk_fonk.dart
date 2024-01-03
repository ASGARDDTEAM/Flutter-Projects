
import 'package:flutter/material.dart';
import 'topluluk_ikinci.dart';

class Fonksiyon extends StatefulWidget {
  String imagePath;
  String toplulukName;
  String toplulukFullName;
  String keytopluluk;

  
  Fonksiyon(this.imagePath, this.toplulukName, this.toplulukFullName, this.keytopluluk);

  @override
  State<Fonksiyon> createState() => _FonksiyonState();
}

class _FonksiyonState extends State<Fonksiyon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 350,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(147, 195, 249, 0.9),
            Color.fromRGBO(108, 115, 251, 0.9),
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Topluluk2(widget.keytopluluk)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage(widget.imagePath),
            ),
            Text(widget.toplulukName, style: TextStyle(color: Colors.white)),
            Text(widget.toplulukFullName, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}