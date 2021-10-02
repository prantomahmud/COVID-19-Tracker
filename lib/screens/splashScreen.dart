import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '../ShomePage.dart';
class MySplashPage extends StatefulWidget {
  @override
  _MySplashPageState createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 15,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'Detect Mask',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.blueAccent,
        ),
      ),
      image: Image.asset("assets/splash.png"),
      photoSize: 130,
      backgroundColor: Colors.white,
      loaderColor: Colors.black,
      loadingText: Text(
        'From Team Perseverance',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,

        ),
      ),
    );
  }
}
