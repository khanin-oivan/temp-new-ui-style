import 'package:flutter/material.dart';
import 'package:temp_new_ui_style/src/themes/colors/mya_light_theme_colors.dart';
import 'package:temp_new_ui_style/src/themes/colors/mya_theme_colors.dart';

extension _ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}

extension _ColorGetter on ThemeData {
  MyaThemeColors get themeColors =>
      extension<MyaThemeColors>() ?? myaLightThemeColors;
}

extension ThemeColorGetter on BuildContext {
  MyaThemeColors get chmThemeColors => Theme.of(this).themeColors;
}
