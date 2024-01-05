import 'package:flutter/material.dart';
import 'package:flutter_project/KaynakMerkezi/Page/teacher_circle.dart';

import '../main/homepage.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 175, 142, 187))),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 212, 185, 222),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: AppBar(
            backgroundColor: const Color(0xff896b95),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 149, 79, 174),
                    Color.fromARGB(255, 85, 142, 239),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            toolbarHeight: 90,
            leadingWidth: 60,
            elevation: 8,
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            centerTitle: true,
            title: const Text(
              "AKADEMİK KADRO",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 96, 23, 129),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Scrollbar(
          trackVisibility: true,
          thickness: 10,
          thumbVisibility: true,
          radius: const Radius.circular(20),
          interactive: true,
          child: ListView.builder(
            primary: true,
            itemCount: 1,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TeacherCircleAvatar("images/emirhoca.png", 1, "Emir ÖZTÜRK"),
                TeacherCircleAvatar("images/ecem.png", 2, "Ecem Hatice ÖZKAN"),
                TeacherCircleAvatar("images/ebrar.png", 3, "Ebrar TAŞDEMİR"),
                TeacherCircleAvatar("images/sena.png", 4, "Sena AKAT"),
                TeacherCircleAvatar("images/elif.png", 5, "İrem Elif GÜL"),
                TeacherCircleAvatar("images/gizem.png", 6, "Zehra Gizem DUMAN"),
                TeacherCircleAvatar("images/tiba.png", 7, "Tiba SHAHANI"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
