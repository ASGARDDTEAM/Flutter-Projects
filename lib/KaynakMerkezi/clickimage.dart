import 'package:flutter/material.dart';

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
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: ElevatedButton(
                        onPressed: () => {}, //DropdownButton(),
                        child: LessonMap.dict2[widget.teacher.toString()]),
                  )
                ],
              );
            }),
      ),
    );
  }
}
