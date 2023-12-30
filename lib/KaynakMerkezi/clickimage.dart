import 'package:flutter/material.dart';
import 'package:flutter_project/KaynakMerkezi/kaynak.dart';
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
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 188, 85, 1.0),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KaynakMerkezi(),
                ),
              );
            }),
      ),
      body: ListView.builder(
        itemCount: LessonMap.dict2[widget.teacher.toString()].length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(
                  1,
                  (subIndex) => ListTile(
                    title: Container(
                      child: Text(LessonMap.dict2[widget.teacher.toString()][index]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
//LessonMap.dict2[widget.teacher.toString()][2]