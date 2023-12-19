
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.fireplace_rounded),),
      body: SafeArea(
        child: DefaultTabController(
                 length: 2,
                 child: Column(
                 children: <Widget>[
        Container(
          child:AppBar(
            title: Text("C H A T T E R C R A F T"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO( 97, 169, 251, 1.0 ),
              ),
            height:50 ,
            ),
        TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home),),
                Tab(icon: Icon(Icons.flash_on),
                )
            ],
            labelColor: Color.fromRGBO( 97, 169, 251, 1.0 ),
            )
          ],
        ),
      ),
      ),
      );
  }
}
