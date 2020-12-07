import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/number_provider.dart';

class Button extends StatefulWidget {
  const Button({
    Key key,
    @required this.angle,
  }) : super(key: key);

  final num angle;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  //================================ Parameters ================================
  bool _isEnabled = true;
  //============================================================================
  @override
  Widget build(BuildContext context) {
    //================================ Parameters ================================
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final numbersProvider = Provider.of<Numbers>(context);
    //============================================================================
    return RaisedButton(
      padding: mediaQuery.orientation == Orientation.portrait
          ? EdgeInsets.symmetric(
              vertical: mediaQuery.size.height * 0.028,
              horizontal: mediaQuery.size.width * 0.3)
          : EdgeInsets.symmetric(
              vertical: mediaQuery.size.height * 0.18,
            ),
      onPressed: !numbersProvider.isLockAvailable
          ? null
          : () {
              // disable the buttons
              numbersProvider.mChangeButtonLock();
              numbersProvider.mGenerateRandomNumber();
              Future.delayed(Duration(milliseconds: 200), () {
                numbersProvider.mGenerateRandomNumber();
              });

              Future.delayed(Duration(milliseconds: 400), () {
                numbersProvider.mGenerateRandomNumber();
              });
              Future.delayed(Duration(milliseconds: 500), () {
                numbersProvider.mGenerateRandomNumber();
                // enable the button again.
                numbersProvider.mChangeButtonLock();
              });
            },
      elevation: 6.0,
      textColor: Colors.red,
      color: Colors.red.shade50,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(
          (widget.angle / 365),
        ),
        child: Text(
          'Roll',
          textAlign: TextAlign.center,
          style: Platform.isIOS
              ? CupertinoTheme.of(context).textTheme.textStyle
              : Theme.of(context).textTheme.bodyText1,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}
