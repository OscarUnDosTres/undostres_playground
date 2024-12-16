import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class View2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View 2'),
      ),
      body: Center(
        child: Image.asset('assets/recompensas.jpg'), // Display image from assets
      ),
    );
  }
}