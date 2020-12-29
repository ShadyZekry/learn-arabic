import 'package:flutter/material.dart';

class DraggableImage extends StatelessWidget {
  final String image;
  DraggableImage({@required this.image});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        height: ((MediaQuery.of(context).size.width) / 3) - 20,
        child: Image.asset(
          'assets/images/' + image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
