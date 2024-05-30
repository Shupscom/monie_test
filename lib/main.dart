import 'package:flutter/material.dart';
import 'package:monie_test/details_screen.dart';
import 'package:monie_test/search_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Gilroy',),
      home: DetailScreen(),
    );
  }
}



