import 'package:flutter/material.dart';
import 'screens/choose_image_screen.dart';
import 'screens/drag_correct_image_screen.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ChooseImageScreen(
//         name: 'دوم',
//         correctImagePath: 'assets/images/دوم.jpg',
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragCorrectImageScreen(
        name: 'دوم',
        correctImagePath: 'assets/images/دوم.jpg',
      ),
    );
  }
}
