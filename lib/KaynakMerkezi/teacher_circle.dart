// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_project/KaynakMerkezi/teacherlist.dart';

class TeacherCircleAvatar extends StatefulWidget {
  String imagePath;
  Function onTap;

  TeacherCircleAvatar(this.imagePath, this.onTap);

  @override
  State<TeacherCircleAvatar> createState() => _TeacherCircleAvatar();
}

class _TeacherCircleAvatar extends State<TeacherCircleAvatar> {
  void onTap() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(255, 210, 141, 1.0))),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 20.0,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      widget.onTap;
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(widget.imagePath),
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

writing(var number) {
  if (TeacherMap.dict.length > 0) {
    return ListTile(
      title: Text(TeacherMap.dict[number.toString()]["name"] + "\n" + "Email: " + TeacherMap.dict[number.toString()]["email"]),
      subtitle: Text(TeacherMap.dict[number.toString()]["git"]),
    );
  }
}
