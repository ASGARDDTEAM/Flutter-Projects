// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_project/KaynakMerkezi/teachermap.dart';

import 'clickimage.dart';

class TeacherCircleAvatar extends StatefulWidget {
  String imagePath;
  String teacher;
  int number;

  TeacherCircleAvatar(this.imagePath, this.number, this.teacher);

  @override
  State<TeacherCircleAvatar> createState() => _TeacherCircleAvatar();
}

class _TeacherCircleAvatar extends State<TeacherCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(255, 210, 141, 1.0))),
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 10,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClickImage(widget.teacher),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(widget.imagePath),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          TeacherMap.dict[widget.number.toString()]["name"] + "\n" + "Email: " + "\n" + TeacherMap.dict[widget.number.toString()]["email"],
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "GitHub:" + "\n" + TeacherMap.dict[widget.number.toString()]["git"],
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
