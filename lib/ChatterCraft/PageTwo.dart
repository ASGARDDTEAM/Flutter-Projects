import 'package:flutter/material.dart';

import 'chattercraftlist.dart';

class PageTwo extends StatefulWidget {
  @override
  State<PageTwo> createState() => _StatePageTwo();
}

class _StatePageTwo extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 149, 79, 174),
                  Colors.blueAccent,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Trends For Ceng ",
            style: TextStyle(color: Color.fromARGB(255, 48, 47, 47), fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: ListView.builder(
            itemCount: ChatterListe().list.length,
            itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                      onTap: () {},
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              Icons.bolt,
                              size: 30,
                              color: Color.fromARGB(255, 23, 102, 214),
                            ),
                          ),
                          Text(ChatterListe().list[index]),
                        ],
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.bottom,
                              child: Icon(
                                Icons.place,
                                size: 15,
                                color: Color.fromARGB(255, 180, 123, 218),
                              ),
                            ),
                            TextSpan(
                              text: ' Mühendislik Fakültesinde ',
                              style: DefaultTextStyle.of(context).style,
                            ),
                            const TextSpan(
                              text: 'Şu an',
                              style: TextStyle(color: Color.fromARGB(255, 16, 187, 36)),
                            ),
                          ],
                        ),
                      )),
                )),
      ),
    );
  }
}
