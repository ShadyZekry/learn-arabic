import 'package:flutter/material.dart';
import 'package:lean_arabic/screens/first_page.dart';

void main() => runApp(LearnArabic());

class LearnArabic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: FirstPage(),
    );
  }
}
