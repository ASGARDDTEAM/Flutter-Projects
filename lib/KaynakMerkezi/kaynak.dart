import 'package:flutter/material.dart';

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
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
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
                pinned: true,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20.0,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTap();
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("images/emirhoca.png"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTap();
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("images/ecem.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20.0,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTap();
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("images/ebrar.png"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTap();
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("images/sena.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20.0,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTap();
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("images/elif.png"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTap();
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("images/gizem.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20.0,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTap();
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage("images/tiba.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
