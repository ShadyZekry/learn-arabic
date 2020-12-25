import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  final Function onPress;
  ImageCard({@required this.imagePath, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: ((MediaQuery.of(context).size.width) / 3) - 20,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
