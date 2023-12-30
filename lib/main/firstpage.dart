import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWS'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator'ı kullanarak bir önceki sayfaya dön
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text('NEWS')),
    );
  }
}
