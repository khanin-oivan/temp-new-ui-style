import 'package:flutter/material.dart';
import 'package:temp_new_ui_style/src/themes/colors/mya_theme_colors.dart';
import 'package:temp_new_ui_style/src/themes/colors/color_tokens.dart';

final myaLightTheme =
    ThemeData.light().copyWith(extensions: <ThemeExtension<dynamic>>[
  myaLightThemeColors,
]);

const myaLightThemeColors = MyaThemeColors(
  black: kColorBlack100,
  white: kColorWhite100,
  whiteBlack: kColorWhite100,
  blackWhite: kColorBlack100,
  blackWhiteOverlay: kColorBlack5,
  mainOverlay: kColorNeutral70,
  neutral: kColorNeutral50,
  //
  bgBg: kColorNeutral90,
  bgContainer: kColorNeutral90,
  bgContainerSection: kColorNeutral99,
  bgBorderContainer: kColorNeutral60,
  bgContainerDisable: kColorNeutral85,
  bgBorderDisable: kColorNeutral85,
  //
  textIconText: kColorNeutral10,
  textIconMidText: kColorNeutral30,
  textIconSubdued: kColorNeutral50,
  textIconOnOverlay: kColorNeutral95,
  textIconDisable: kColorNeutral60,
  //
  primaryPrimary: kColorPrimary70,
  primarySurface: kColorPrimary90,
  primaryPressed: kColorPrimary50,
  primaryOnPrimary: kColorPrimary10,
  primaryOnSurface: kColorPrimary30,
  primaryBorder: kColorPrimary60,
  //
  secondarySecondary: kColorSecondary95,
  secondarySurface: kColorSecondary95,
  secondaryPressed: kColorSecondary80,
  secondaryOnSecondary: kColorSecondary20,
  secondaryOnSurface: kColorSecondary60,
  secondaryBorder: kColorSecondary60, //TODO: Check with designer
  //
  successSuccess: kColorSuccess60,
  successOnSurface: kColorSuccess40,
  successSurface: kColorSuccess99,
  successOnSuccess: kColorSuccess99,
  successPressed: kColorSuccess40,
  successBorder: kColorSuccess90,
  //
  warningWarning: kColorWarning20,
  warningSurface: kColorWarning10,
  warningPressed: kColorWarning70,
  warningOnWarning: kColorWarning99,
  warningOnSurface: kColorWarning50,
  warningBorder: kColorWarning80,
  //
  errorError: kColorDanger40,
  errorSurface: kColorDanger99,
  errorPressed: kColorDanger30,
  errorOnError: kColorDanger99,
  errorOnSurface: kColorDanger30,
  errorBorder: kColorDanger90,
  //
  notificationNotification: kColorDanger50,
  //
  loyaltyPrivilegPrivilege: kColorPrivilege30,
  loyaltyPointsPoints: kColorPoints40,
  loyaltyTierPlatinum: kColorPlatinum80,
  loyaltyTierGold: kColorGold60,
  loyaltyTierEmerald: kColorEmerald40,
  loyaltyTierAisCustomer: kColorAisCustomer60,
  //
  entertainmentEntertainment: kColorEntertainment80,
  storeStore: kColorStore70,
  fibreFibre: kColorFibre60,
  starStar: kColorStar70,
  elevationColor: kColorBlack5,
);
