import 'dart:math';

import 'package:flutter/material.dart';

class Numbers with ChangeNotifier {
  // the generated numbers
  int _num1 = 1;
  int _num2 = 1;

  // get them via the getter, best practice.
  int get num1 {
    return _num1;
  }

  int get num2 {
    return _num2;
  }

  // a variable to disable the other button when one of them is active
  bool _isLockAvailabale = true;
  bool get isLockAvailable {
    return _isLockAvailabale;
  }

  //================================= Methods ==================================
  void mGenerateRandomNumber() {
    DateTime now = DateTime.now();
    var _randNum1 = Random(now.microsecondsSinceEpoch);
    var _randNum2 = Random(now.millisecondsSinceEpoch);
    _num1 = _randNum1.nextInt(6) + 1;
    _num2 = _randNum2.nextInt(6) + 1;
    notifyListeners();
  }

  void mChangeButtonLock() {
    _isLockAvailabale = !_isLockAvailabale;
    notifyListeners();
  }
  //============================================================================
}

// import 'dart:math';

// import 'package:flutter/material.dart';

// class Numbers with ChangeNotifier {
//   List<int> _num1 = [];
//   List<int> _num2 = [];
//   List<int> get num1 {
//     return _num1;
//   }

//   List<int> get num2 {
//     return _num2;
//   }

//   //================================= Methods ==================================
//   void mGenerateRandomNumber() {
//     var now = DateTime.now();
//     var _randNum1 = Random(now.microsecondsSinceEpoch);
//     var _randNum2 = Random(now.millisecondsSinceEpoch);
//     for (int i = 0; i < 6; i++) {
//       _num1.add(_randNum1.nextInt(6) + 1);
//       _num2.add(_randNum2.nextInt(6) + 1);
//       notifyListeners();
//     }
//   }
//   //============================================================================
// }
