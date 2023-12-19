import 'package:flutter/material.dart';
import 'package:flutter_project/KaynakMerkezi/teacher_circle.dart';

void main() {
  runApp(KaynakMerkezi());
}

class KaynakMerkezi extends StatefulWidget {
  KaynakMerkezi({super.key});

  State<KaynakMerkezi> createState() => _KaynakMerkeziState();
}

class _KaynakMerkeziState extends State<KaynakMerkezi> {
  Widget build(BuildContext context) {
    void onTap() {
      print("ecem");
    }

    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(255, 210, 141, 1.0))),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            backgroundColor: Color.fromRGBO(255, 188, 85, 1.0),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              "TRAKYA ÜNİVERSİTESİ AKADEMİK KADRO",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
        ),
        body: Scrollbar(
          trackVisibility: true,
          thickness: 10,
          thumbVisibility: true,
          radius: Radius.circular(20),
          interactive: true,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => Column(
              children: [
                TeacherCircleAvatar("images/emirhoca.png", 1, onTap),
                TeacherCircleAvatar("images/ecem.png", 2, onTap),
                TeacherCircleAvatar("images/ebrar.png", 3, onTap),
                TeacherCircleAvatar("images/sena.png", 4, onTap),
                TeacherCircleAvatar("images/elif.png", 5, onTap),
                TeacherCircleAvatar("images/gizem.png", 6, onTap),
                TeacherCircleAvatar("images/tiba.png", 7, onTap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
