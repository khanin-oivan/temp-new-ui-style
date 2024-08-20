import 'package:flutter/material.dart';
import 'package:temp_new_ui_style/src/themes/colors/mya_light_theme_colors.dart';
import 'package:temp_new_ui_style/src/themes/colors/mya_theme_colors.dart';
import 'package:temp_new_ui_style/src/themes/text_styles/mya_text_style.dart';
import 'package:temp_new_ui_style/src/themes/text_styles/mya_th_text_style.dart';

// extension _ThemeGetter on BuildContext {
//   // Usage example: `context.theme`
//   ThemeData get theme => Theme.of(this);
// }

extension _ColorGetter on ThemeData {
  MyaThemeColors get themeColors =>
      extension<MyaThemeColors>() ?? myaLightThemeColors;
}

extension ThemeColorGetter on BuildContext {
  MyaThemeColors get myaThemeColors => Theme.of(this).themeColors;
}

extension _TextStyleGetter on ThemeData {
  MyaTextStyle get themeTextStyle =>
      extension<MyaTextStyle>() ?? myaThTextStyle;
}

extension ThemeTextStyleGetter on BuildContext {
  MyaTextStyle get myaTextStyle => Theme.of(this).themeTextStyle;
}
