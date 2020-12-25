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
        correctImagePath: 'assets/images/ارنب.jpg',
        imagePath1: 'assets/images/زرافه.jpg',
        imagePath2: 'assets/images/فيل.png',
      ),
    );
  }
}
