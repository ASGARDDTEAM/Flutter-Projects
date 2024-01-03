import 'package:flutter/material.dart';
import 'package:flutter_project/Topluluklar/toluluk_fonk2.dart';


void main() {
  runApp(const ToplulukMerkezi());
}

class ToplulukMerkezi extends StatefulWidget {
  const ToplulukMerkezi({super.key});

  @override
  State<ToplulukMerkezi> createState() => _ToplulukMerkeziState();
}

class _ToplulukMerkeziState extends State<ToplulukMerkezi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 115, 19, 19))),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 244, 255),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: Container(decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [
            Color.fromRGBO(108, 115, 251, 0.9),
            Color.fromRGBO(147, 195, 249, 0.9),
        ],
          stops: [0.0,1.0],
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter,
          ),
      ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomePage(),
                  //   ),
                  // );
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              title: const Text(
                "T O P L U K L A R",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),
                textAlign: TextAlign.center,
              ),
              
            ),
          ),
          
        ),
        body: ListWheelScrollView(
          perspective: 0.001,
          itemExtent: 350,
          physics: FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index)=> Text('aa',
          style: TextStyle(color: Colors.white),),
           
            children: ListeyeAtma.toplulukElevateButton()
            ,
          ),
          ) ,

        );
      }}