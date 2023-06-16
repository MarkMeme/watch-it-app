import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  static const String routeName = 'test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Test Screen'),
      ),
      backgroundColor: Colors.brown,
    );
  }
}
