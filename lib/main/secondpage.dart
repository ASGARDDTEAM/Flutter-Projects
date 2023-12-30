import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            // Navigator'ı kullanarak bir önceki sayfaya dön
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text('TWİTTER')),
    );
  }
}
