import 'package:flutter/material.dart';
import 'package:learn_arabic/dashbord/dashbordscreen.dart';
import 'package:learn_arabic/home_screen.dart';
import 'package:learn_arabic/screens/about_us_screen.dart';
import 'package:learn_arabic/screens/contact_us_screen.dart';
import 'package:learn_arabic/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color(0xff556bf4),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Cairo",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home_screen': (context) => HomeScreen(),
        '/dashboard_screen': (context) => Edition(),
        '/ContactUs_creen': (context) => ContactUsScreen(),
        '/AboutUs_creen': (context) => AboutUsScreen(),
        // '/drag_screen': (context) => DragCorrectImageScreen(),
        // '/choose_screen': (context) => ChooseImageScreen(),
      },
    );
  }
}
