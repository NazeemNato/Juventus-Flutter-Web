import 'package:flutter/material.dart';
import 'package:juventusRuling/screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      title: 'JRC',
      theme: ThemeData.dark(),
    );
  }
}