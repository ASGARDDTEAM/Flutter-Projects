import 'package:flutter/material.dart';
import 'package:flutter_project/KaynakMerkezi/teacherimagelist.dart';
import 'package:flutter_project/KaynakMerkezi/teacherlist.dart';

class TeacherCircleAvatar extends StatefulWidget {
  String imagePath;
  int number;
  Function onTap;

  TeacherCircleAvatar(this.imagePath, this.number, this.onTap);

  @override
  State<TeacherCircleAvatar> createState() => _TeacherCircleAvatar();
}

class _TeacherCircleAvatar extends State<TeacherCircleAvatar> {
  late TeacherImagePath teacherImagePath;
  late TeacherMap teacherMap;

  writing(var number) {
    ListTile(
      title: teacherMap.dict[number["name"]],
      subtitle: teacherMap.dict[number["email"]],
      leading: Text(teacherMap.dict[number["git"]]),
    );
  }

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
                writing(widget.number),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
