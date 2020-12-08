import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/number_provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(Dicer());
}

class Dicer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Numbers(),
          ),
        ],
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: 'Dicee',
          theme: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(
                color: Colors.red,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              navActionTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            primaryColor: Colors.red,
            primaryContrastingColor: Colors.white,
          ),
          home: HomeScreen(),
        ),
      );
    } else {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Numbers(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dicee',
          theme: ThemeData(
            textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(
                color: Colors.red,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            primarySwatch: Colors.red,

            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
        ),
      );
    }
  }
}
