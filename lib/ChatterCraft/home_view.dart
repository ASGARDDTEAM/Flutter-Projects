
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.flash_on),),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("C H A T T E R C R A F T"),
              centerTitle: true,
              backgroundColor: Color.fromRGBO( 97, 169, 251, 1.0 ),
              
            ),
            TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home),),
                Tab(icon: Icon(Icons.fireplace_rounded),)

            ],
            )
          ],
        ),
      )
      );
  }
}
