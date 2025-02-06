import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  MediaQueryData get mediaQuery {
    return MediaQuery.of(this);
  }

  Size get kSize {
    return MediaQuery.of(this).size;
  }

  double get screenWidth {
    return mediaQuery.size.width;
  }

  double get screenHeight {
    return mediaQuery.size.height;
  }

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
