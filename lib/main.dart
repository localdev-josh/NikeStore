import 'package:flutter/material.dart';
import 'package:shoe_store/pages/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoe store',
      home: LandingPage(),
    );
  }
}