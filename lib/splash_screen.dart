import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // wait 3 seconds
    Future.delayed(Duration(seconds: 3)).then((value) =>
        //then route to home screen
        Navigator.pushNamedAndRemoveUntil(
            context, '/home_screen', (route) => false));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/images/splash-background.jpg"),
      ),
    );
  }
}
