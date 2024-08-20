import 'package:flutter/widgets.dart';
import 'package:temp_new_ui_style/src/themes/text_styles/mya_text_style.dart';
import 'package:temp_new_ui_style/src/themes/text_styles/text_style_tokens.dart';

final myaThTextStyle = MyaTextStyle(
  displayLarge: TextStyle(
    fontWeight: kFontWeight2,
    fontSize: kFontScale14,
    height: kLineHeight14,
    letterSpacing: kLetterSpacing5,
  ),
  displayMedium: TextStyle(
    fontWeight: kFontWeight2,
    fontSize: kFontScale13,
    height: kLineHeight13,
    letterSpacing: kLetterSpacing5,
  ),
  displaySmall: TextStyle(),
  headlineLarge: TextStyle(),
  headlineMedium: TextStyle(),
  headlineSmall: TextStyle(),
  titleLarge: TextStyle(),
  titleMedium: TextStyle(),
  titleSmall: TextStyle(),
  bodyLarge: TextStyle(),
  bodyMedium: TextStyle(),
  bodySmall: TextStyle(),
  labelLarge: TextStyle(),
  labelMedium: TextStyle(),
  labelSmall: TextStyle(),
);
