import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/home_view.dart';

void main() => runApp(ChatterApp());

class ChatterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Metarial app", home: HomeView());
  }
}
