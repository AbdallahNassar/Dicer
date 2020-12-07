import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/button.dart';
import '../providers/number_provider.dart';
import '../widgets/dice.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //================================ Parameters ==============================
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size deviceSize = mediaQuery.size;
    //==========================================================================
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              middle: Text(
                "Dicer",
                style: CupertinoTheme.of(context).textTheme.navActionTextStyle,
              ),
            )
          : AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Dicer',
                style: Theme.of(context).textTheme.headline6,
              ),
              centerTitle: true,
            ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: mediaQuery.orientation == Orientation.portrait
                      ? EdgeInsets.all(mediaQuery.size.width * 0.01)
                      : EdgeInsets.all(mediaQuery.size.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (mediaQuery.orientation == Orientation.landscape)
                        Expanded(
                          flex: 1,
                          child: Button(angle: 91),
                        ),
                      Consumer<Numbers>(
                        builder: (context, numberProvider, child) => Dice(
                          mediaQuery: mediaQuery,
                          // numberList: numberProvider.num1,
                          number: numberProvider.num1,
                        ),
                      ),
                      Consumer<Numbers>(
                        builder: (context, numberProvider, child) => Dice(
                          mediaQuery: mediaQuery,
                          // numberList: numberProvider.num2,
                          number: numberProvider.num2,
                        ),
                      ),
                      if (mediaQuery.orientation == Orientation.landscape)
                        Expanded(
                          flex: 1,
                          child: Button(angle: 273),
                        ),
                    ],
                  ),
                ),
                if (mediaQuery.orientation == Orientation.portrait)
                  SizedBox(
                    height: deviceSize.height * 0.1,
                  ),
                if (mediaQuery.orientation == Orientation.portrait)
                  Button(angle: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
