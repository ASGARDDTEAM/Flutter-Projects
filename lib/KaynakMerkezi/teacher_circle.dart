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
    return Center(
      child: Wrap(
        spacing: 20,
        runSpacing: 20.0,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                widget.onTap;
              },
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(widget.imagePath),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
