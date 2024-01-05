// // topluluk_ikinci.dart
import 'package:flutter/material.dart';

import 'package:flutter_project/Topluluklar/topluluk_liste.dart';

// ignore: must_be_immutable
class Topluluk2 extends StatefulWidget {
  String keytopluluk;
  Topluluk2(this.keytopluluk);
  @override
  State<Topluluk2> createState() => _Topluluk2State();
}

class _Topluluk2State extends State<Topluluk2> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 244, 255),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 235, 244, 255),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100.0),
                  bottomRight: Radius.circular(100.0),
                ),
                child: Image.asset(
                  "${ToplulukMap.dict[widget.keytopluluk]["image"]}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadiusDirectional.only(topStart: Radius.circular(20.0), topEnd: Radius.circular(20.0)),
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      height: 75,
                      width: 1000,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(108, 115, 251, 0.9),
                            Color.fromRGBO(147, 195, 249, 0.9),
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${(ToplulukMap.dict[widget.keytopluluk]['kisim'])}'.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    height: 75,
                    width: 1000,
                    color: const Color.fromRGBO(147, 195, 249, 0.9),
                    child: Center(
                      child: Text(
                        '${(ToplulukMap.dict[widget.keytopluluk]['uisim'])}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      height: 500,
                      width: 1000,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(147, 195, 249, 0.9),
                            Color.fromRGBO(108, 115, 251, 0.9),
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Text(
                        '${ToplulukMap.dict[widget.keytopluluk]['aciklama']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
