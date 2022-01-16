import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomTheme {
  const CustomTheme();

  static const Color loginGradientStart = Color(0xFF6BD4FB);
  static const Color loginGradientEnd   = Color(0xFFB2EEFB);
  static const Color white              = Color(0xFFFFFFFF);
  static const Color blue               = Color(0xFF00BAFF);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops:  <double>[0.0, 1.0],
    begin:  Alignment.topCenter,
    end:    Alignment.bottomCenter, 
  );

  static const LinearGradient secodaryGradient = LinearGradient(
    colors: <Color>[loginGradientEnd, loginGradientStart ],
    stops:  <double>[0.0, 1.0],
    begin:  Alignment.topCenter,
    end:    Alignment.bottomCenter, 
  );
}
