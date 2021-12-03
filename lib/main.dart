// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyAppMovie());
}

class MyAppMovie extends StatelessWidget {
  const MyAppMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Movies',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
    );
  }
}
