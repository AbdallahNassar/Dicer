import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _counter = 1;
  bool _testBool = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                print('_testBool = $_testBool');
                _testBool = !_testBool;
              });
            },
            child: Transform.rotate(
              angle: _counter * 100 / 365,
              child: AnimatedContainer(
                onEnd: () {
                  setState(() {
                    if (_counter < 3) {
                      _testBool = !_testBool;
                      _counter += 1;
                    } else {
                      _counter = 0;
                    }
                  });
                },
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(
                  milliseconds: 300,
                ),
                height: _testBool ? 200 : 300,
                width: _testBool ? 200 : 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/images/diceNo${_counter + 1}.svg',
                  color: Colors.black,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // child: AnimatedContainer(
            //   // _testBool ? 10 :
            //   curve: Curves.fastLinearToSlowEaseIn,
            //   duration: Duration(
            //     seconds: 3,
            //   ),
            //   height: _testBool ? 200 : 300,
            //   width: _testBool ? 200 : 300,

            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(
            //         30.0,
            //       ),
            //     ),
            //     alignment: Alignment.center,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
