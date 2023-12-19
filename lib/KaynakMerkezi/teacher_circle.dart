import 'package:flutter/material.dart';

class TeacherCircleAvatar extends StatefulWidget {
  String imagePath;
  Function onTap;

  TeacherCircleAvatar(this.imagePath, this.onTap);

  @override
  State<TeacherCircleAvatar> createState() => _TeacherCircleAvatar();
}

class _TeacherCircleAvatar extends State<TeacherCircleAvatar> {
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
