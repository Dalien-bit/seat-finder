import 'package:flutter/material.dart';
import '../screens/universal widgets/layout_widgets.dart';

double get appBarHeight => appbar('something').preferredSize.height;

Size deviceSize(BuildContext context) => MediaQuery.of(context).size;

String getSeatType(int seatNumber) {
  int rem = seatNumber % 8;
  if (rem == 1 || rem == 4) {
    return 'Lower';
  } else if (rem == 2 || rem == 5) {
    return 'Middle';
  } else if (rem == 3 || rem == 6) {
    return 'Upper';
  } else if (rem == 7) {
    return 'Side Lower';
  } else {
    return 'Side Upper';
  }
}

Path customPathUpper = Path()
  ..moveTo(0, 25)
  ..lineTo(0, 0)
  ..moveTo(75, 0)
  ..lineTo(-2.5, 0)
  ..moveTo(75, 0)
  ..lineTo(154, 0)
  ..lineTo(154, 25);

Path customPathSideUpper = Path()
  ..moveTo(0, 25)
  ..lineTo(0, 0)
  ..moveTo(25, 0)
  ..lineTo(-2.5, 0)
  ..moveTo(25, 0)
  ..lineTo(54, 0)
  ..lineTo(54, 25);

Path customPathSideLower = Path()
  ..moveTo(0, 25)
  ..lineTo(0, 0)
  ..moveTo(25, 0)
  ..lineTo(-2.5, 0)
  ..moveTo(25, 0)
  ..lineTo(54, 0)
  ..lineTo(54, 25);

Path customPathLower = Path()
  ..moveTo(0, 25)
  ..lineTo(0, 50)
  ..moveTo(75, 54)
  ..lineTo(-2.5, 54)
  ..moveTo(75, 54)
  ..lineTo(154, 54)
  ..lineTo(154, 25)
  ..moveTo(0, 25)
  ..lineTo(0, 54);
