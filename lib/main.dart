import 'package:flutter/material.dart';
import 'screens/choose_image_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChooseImageScreen(
        name: 'ارنب',
        correctImagePath: 'images/ارنب.jpg',
        imagePath1: 'images/زرافه.jpg',
        imagePath2: 'images/فيل.png',
      ),
    );
  }
}
