import 'package:flutter/material.dart';
import 'screen/home_screen.dart';

void main() {
  runApp(MyTravelApp());
}

class MyTravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App UI',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
