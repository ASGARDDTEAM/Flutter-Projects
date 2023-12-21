import 'package:flutter/material.dart';
import 'package:flutter_project/KaynakMerkezi/teacher_circle.dart';

void main() {
  runApp(const KaynakMerkezi());
}

class KaynakMerkezi extends StatefulWidget {
  const KaynakMerkezi({super.key});

  @override
  State<KaynakMerkezi> createState() => _KaynakMerkeziState();
}

class _KaynakMerkeziState extends State<KaynakMerkezi> {
  @override
  Widget build(BuildContext context) {
    void onTap() {
      print("ecem");
    }

    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(255, 210, 141, 1.0))),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(255, 188, 85, 1.0),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const Text(
              "TRAKYA ÜNİVERSİTESİ AKADEMİK KADRO",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
        ),
        body: Scrollbar(
          trackVisibility: true,
          thickness: 10,
          thumbVisibility: true,
          radius: const Radius.circular(20),
          interactive: true,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => Column(
              children: [
                TeacherCircleAvatar("images/emirhoca.png", onTap),
                writing(1),
                TeacherCircleAvatar("images/ecem.png", onTap),
                writing(2),
                TeacherCircleAvatar("images/ebrar.png", onTap),
                writing(3),
                TeacherCircleAvatar("images/sena.png", onTap),
                writing(4),
                TeacherCircleAvatar("images/elif.png", onTap),
                writing(5),
                TeacherCircleAvatar("images/gizem.png", onTap),
                writing(6),
                TeacherCircleAvatar("images/tiba.png", onTap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
