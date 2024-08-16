import 'package:flutter/material.dart';

@immutable
class MyaThemeColors extends ThemeExtension<MyaThemeColors> {
  const MyaThemeColors({
    required this.black,
    required this.white,
    required this.whiteBlack,
    required this.blackWhite,
    required this.blackWhiteOverlay,
    required this.mainOverlay,
    required this.neutral,
    required this.bgBg,
    required this.bgContainer,
    required this.bgContainerSection,
    required this.bgBorderContainer,
    required this.bgContainerDisable,
    required this.bgBorderDisable,
    required this.textIconText,
    required this.textIconMidText,
    required this.textIconSubdued,
    required this.textIconOnOverlay,
    required this.textIconDisable,
    required this.primaryPrimary,
    required this.primarySurface,
    required this.primaryPressed,
    required this.primaryOnPrimary,
    required this.primaryOnSurface,
    required this.primaryBorder,
    required this.secondarySecondary,
    required this.secondarySurface,
    required this.secondaryPressed,
    required this.secondaryOnSecondary,
    required this.secondaryOnSurface,
    required this.secondaryBorder,
    required this.warningWarning,
    required this.warningSurface,
    required this.warningPressed,
    required this.warningOnWarning,
    required this.warningOnSurface,
    required this.warningBorder,
    required this.errorError,
    required this.errorSurface,
    required this.errorPressed,
    required this.errorOnError,
    required this.errorOnSurface,
    required this.errorBorder,
    required this.notificationNotification,
    required this.loyaltyPrivilegPrivilege,
    required this.loyaltyPointsPoints,
    required this.loyaltyTierPlatinum,
    required this.loyaltyTierGold,
    required this.loyaltyTierEmerald,
    required this.loyaltyTierAisCustomer,
    required this.entertainmentEntertainment,
    required this.storeStore,
    required this.fibreFibre,
    required this.starStar,
    required this.elevationColor,
  });

  // common
  final Color black;
  final Color white;
  final Color whiteBlack;
  final Color blackWhite;
  final Color blackWhiteOverlay;
  final Color mainOverlay;
  final Color neutral;

  // common/background
  final Color bgBg;
  final Color bgContainer;
  final Color bgContainerSection;
  final Color bgBorderContainer;
  final Color bgContainerDisable;
  final Color bgBorderDisable;

  // common/text-icon
  final Color textIconText;
  final Color textIconMidText;
  final Color textIconSubdued;
  final Color textIconOnOverlay;
  final Color textIconDisable;

  // category/primary
  final Color primaryPrimary;
  final Color primarySurface;
  final Color primaryPressed;
  final Color primaryOnPrimary;
  final Color primaryOnSurface;
  final Color primaryBorder;

  // category/secondary
  final Color secondarySecondary;
  final Color secondarySurface;
  final Color secondaryPressed;
  final Color secondaryOnSecondary;
  final Color secondaryOnSurface;
  final Color secondaryBorder;

  // category/warning
  final Color warningWarning;
  final Color warningSurface;
  final Color warningPressed;
  final Color warningOnWarning;
  final Color warningOnSurface;
  final Color warningBorder;

  // category/error
  final Color errorError;
  final Color errorSurface;
  final Color errorPressed;
  final Color errorOnError;
  final Color errorOnSurface;
  final Color errorBorder;

  // category/notification
  final Color notificationNotification;

  // category/loyalty/privilege
  final Color loyaltyPrivilegPrivilege;

  // category/loyalty/points
  final Color loyaltyPointsPoints;

  // category/loyalty/tier
  final Color loyaltyTierPlatinum;
  final Color loyaltyTierGold;
  final Color loyaltyTierEmerald;
  final Color loyaltyTierAisCustomer;

  // category/entertainment
  final Color entertainmentEntertainment;

  // category/store
  final Color storeStore;

  // category/fibre
  final Color fibreFibre;

  // category/star
  final Color starStar;

  // elevation
  final Color elevationColor;

  @override
  MyaThemeColors copyWith() {
    //TODO: if implement copy with, must change declaration to nullable.
    throw UnimplementedError();
  }

  @override
  MyaThemeColors lerp(MyaThemeColors? other, double t) {
    //TODO
    return this;
  }
}
