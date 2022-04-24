import 'package:flutter/material.dart';

class MyThemes {
  static Color greenColor = const Color(0xFF04747A);
  static Color blueColor = const Color(0xFF5860A9);
  static Color qRBottomBarColor = const Color(0xFF2B5060);

  static final backgroundGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      const Color(0xFF04747A),
      const Color(0xFF2B6B90).withOpacity(0.95),
      const Color(0xFF43659D).withOpacity(0.90),
      const Color(0xFF5860A9).withOpacity(0.85),
      const Color(0xFF5860A9).withOpacity(0.80),
      const Color(0xFF5860A9).withOpacity(0.75),
    ],
  );
}
