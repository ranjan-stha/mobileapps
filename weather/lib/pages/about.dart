import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('Developed by:')),
          Center(child: Text('Ranjan Shrestha')),
          Center(child: Text('ranjan.shrestha.np@gmail.com')),
        ],
      ),
    );
  }
}
