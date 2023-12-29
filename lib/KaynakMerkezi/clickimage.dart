import 'package:flutter/material.dart';
import 'package:flutter_project/KaynakMerkezi/kaynak.dart';
import 'package:flutter_project/KaynakMerkezi/pdfmap.dart';
import 'package:flutter_project/KaynakMerkezi/pdfpage.dart';
import 'lessonmap.dart';

// ignore: must_be_immutable
class ClickImage extends StatefulWidget {
  String? teacher;
  // ignore: use_key_in_widget_constructors
  ClickImage(this.teacher);

  @override
  State<ClickImage> createState() => _ClickImageState();
}

class _ClickImageState extends State<ClickImage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 146, 236),
      appBar: AppBar(
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
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KaynakMerkezi(),
                ),
              );
            }),
      ),
      body: ListView.builder(
        itemCount: LessonMap.dict2[widget.teacher.toString()].length,
        itemBuilder: (context, index) => Card(
          child: ExpansionTile(
            backgroundColor: const Color.fromRGBO(221, 223, 253, 1.0),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(LessonMap.dict2[widget.teacher.toString()][index], style: TextStyle(fontFamily: "Play fair Display")),
                ],
              ),
            ),
            children: [
              if (PdfMap.dict3.containsKey(
                LessonMap.dict2[widget.teacher.toString()][index],
              ))
                for (var pdf in PdfMap.dict3[LessonMap.dict2[widget.teacher.toString()][index]])
                  ListTile(
                    title: Text(pdf),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFPage(pdfPath: pdf),
                        ),
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    ));
  }
}
