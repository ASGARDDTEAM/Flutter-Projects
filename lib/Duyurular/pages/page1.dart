import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is Page 1',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            // You can add more UI elements or messages here
          ],
        ),
      ),
    );
  }
}
