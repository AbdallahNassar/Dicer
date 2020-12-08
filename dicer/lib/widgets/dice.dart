import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Dice extends StatefulWidget {
  //================================ Parameters ===============================
  final MediaQueryData mediaQuery;
  final int number;
  //================================ Constructor ===============================
  const Dice({
    Key key,
    @required this.mediaQuery,
    @required this.number,
  }) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int _counter = -1;
  @override
  Widget build(BuildContext context) {
    _counter = _counter < 3 ? (_counter + 1) : 0;
    //================================ Parameters ==============================
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    //  numberList.length == 0 ? 1 : numberList[numberList.length - 1];
    //==========================================================================
    return Expanded(
      flex: 4,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        constraints: BoxConstraints(
          // check orientaion then check the counter value to alter the height
          // based on it
          maxHeight: mediaQuery.orientation == Orientation.landscape
              ? _counter == 0
                  ? mediaQuery.size.width * 0.3
                  // landscape & counter != 0
                  : _counter.isEven
                      // landscape & counter is even
                      ? mediaQuery.size.width * 0.25
                      // landscape & counter is odd
                      : mediaQuery.size.width * 0.15
              :
              // portrait
              _counter == 0
                  // portrait & counter != 0
                  ? mediaQuery.size.width * 0.45
                  : _counter.isEven
                      // portrait & counter is even
                      ? mediaQuery.size.width * 0.33
                      // portrait & counter is odd
                      : mediaQuery.size.width * 0.2,
        ),
        alignment: _counter == 0
            ? Alignment.center
            : _counter.isEven
                ? Alignment.bottomRight
                : Alignment.bottomLeft,
        onEnd: () {
          setState(() {
            _counter = -1;
          });
        },
        child: SvgPicture.asset(
          'assets/images/diceNo${widget.number}.svg',
          color: Colors.white,
          width: mediaQuery.orientation == Orientation.landscape
              ? mediaQuery.size.width * 0.3
              : mediaQuery.size.width * 0.45,
        ),
      ),
    );
  }
}
