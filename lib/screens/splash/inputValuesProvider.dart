import 'package:flutter/cupertino.dart';

class InputValues extends ChangeNotifier {
  var a1, c1, b1, d1, sum;
  // note memoire
  sommeA(val1, val2, val3, val4) {
    a1 = double.parse(val1) + double.parse(val2) + double.parse(val3) + double.parse(val4);
    notifyListeners();
  }

  //note source code & analyse
  sommeB(val1, val2, val3, val4) {
    b1 = double.parse(val1) + double.parse(val2) + double.parse(val3) + double.parse(val4);
    notifyListeners();
  }

  //note presentation
  sommeC(val1, val2, val3) {
    c1 = double.parse(val1) + double.parse(val2) + double.parse(val3);
    notifyListeners();
  }

  // response to question and Final mark
  finalmark(val1) {
    d1 = double.parse(val1);
    sum = a1 + b1 + c1 + d1;
    notifyListeners();
  }
}
