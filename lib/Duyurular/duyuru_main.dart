import 'package:flutter/material.dart';
import 'package:ikinci_sayfa/home.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: Home()
    );
  }
} 
