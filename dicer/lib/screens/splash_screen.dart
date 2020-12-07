import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class CustomSplashScreen extends StatelessWidget {
  //================================ Parameters ================================
  final dynamic nextScreen;
  //================================ Constructor ===============================
  const CustomSplashScreen({
    Key key,
    this.nextScreen,
  }) : super(key: key);
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      gradientBackground: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.red.shade500,
          Colors.white,
          Colors.redAccent,
          Colors.red.shade100
        ],
      ),
      useLoader: false,
      seconds: 1,
      navigateAfterSeconds: nextScreen,
      image: Image.asset('assets/icon/appIcon.png'),
      backgroundColor: Colors.white,
      photoSize: 130,
      loadingText: Text(
        'DICER',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Color.lerp(
            Colors.red,
            Colors.white,
            0.8,
          ),
        ),
      ),
    );
  }
}
