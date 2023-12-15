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
      print("sena");
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
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "Gradient background for youtube header_ Градиентный фон для шапки ютуб, free use.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/fotor-ai-2023120805151.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/fotor-ai-2023120805151.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/fotor-ai-2023120805151.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/fotor-ai-2023120805151.jpg"),
                    ),
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/fotor-ai-2023120805151.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/fotor-ai-2023120805151.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/fotor-ai-2023120805151.jpg"),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onTap();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/fotor-ai-2023120805151.jpg"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
