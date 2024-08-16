import 'package:flutter/material.dart';

@immutable
class ChmThemeColors extends ThemeExtension<ChmThemeColors> {
  const ChmThemeColors({
    required this.primary,
    required this.primarySubdued,
    required this.primarySurface,
    required this.primaryOnSurface,
    required this.primaryHover,
    required this.primaryPressed,
    //
    required this.points,
    required this.pointsSubdued,
    required this.pointsSurface,
    required this.pointsOnSurface,
    required this.pointsHover,
    required this.pointsPressed,
    //
    required this.privileges,
    required this.privilegesSubdued,
    required this.privilegesSurface,
    required this.privilegesOnSurface,
    required this.privilegesHover,
    required this.privilegesPressed,
    //
    required this.entertainment,
    required this.entertainmentSubdued,
    required this.entertainmentSurface,
    required this.entertainmentOnSurface,
    required this.entertainmentHover,
    required this.entertainmentPressed,
    //
    required this.store,
    required this.storeSubdued,
    required this.storeSurface,
    required this.storeOnSurface,
    required this.storeHover,
    required this.storePressed,
    //
    required this.platinum,
    required this.platinumSubdued,
    required this.platinumSurface,
    required this.platinumOnSurface,
    required this.platinumHover,
    required this.platinumPressed,
    //
    required this.gold,
    required this.goldSubdued,
    required this.goldSurface,
    required this.goldOnSurface,
    required this.goldHover,
    required this.goldPressed,
    //
    required this.emerald,
    required this.emeraldSubdued,
    required this.emeraldSurface,
    required this.emeraldOnSurface,
    required this.emeraldHover,
    required this.emeraldPressed,
    //
    required this.customer,
    required this.customerSubdued,
    required this.customerSurface,
    required this.customerOnSurface,
    required this.customerHover,
    required this.customerPressed,
    //
    required this.success,
    required this.successSubdued,
    required this.successSurface,
    required this.successOnSurface,
    required this.successHover,
    required this.successPressed,
    //
    required this.warning,
    required this.warningSubdued,
    required this.warningSurface,
    required this.warningOnSurface,
    required this.warningHover,
    required this.warningPressed,
    //
    required this.error,
    required this.errorSubdued,
    required this.errorSurface,
    required this.errorOnSurface,
    required this.errorHover,
    required this.errorPressed,
    //
    required this.start,
    required this.startSubdued,
    required this.startSurface,
    required this.startOnSurface,
    required this.startHover,
    required this.startPressed,
    //
    required this.notification,
    required this.notificationSubdued,
    required this.notificationSurface,
    required this.notificationOnSurface,
    required this.notificationHover,
    required this.notificationPressed,
    //
    required this.fbb,
    required this.fbbSubdued,
    required this.fbbSurface,
    required this.fbbOnSurface,
    required this.fbbHover,
    required this.fbbPressed,
    //
    required this.text,
    required this.textSubdued,
    required this.textDisabled,
    required this.black,
    required this.white,
    required this.backgroundMain,
    required this.backgroundDisabled,
    required this.divider,
    required this.surface,
  });
  final Color primary;
  final Color primarySubdued;
  final Color primarySurface;
  final Color primaryOnSurface;
  final Color primaryHover;
  final Color primaryPressed;

  final Color points;
  final Color pointsSubdued;
  final Color pointsSurface;
  final Color pointsOnSurface;
  final Color pointsHover;
  final Color pointsPressed;

  final Color privileges;
  final Color privilegesSubdued;
  final Color privilegesSurface;
  final Color privilegesOnSurface;
  final Color privilegesHover;
  final Color privilegesPressed;

  final Color entertainment;
  final Color entertainmentSubdued;
  final Color entertainmentSurface;
  final Color entertainmentOnSurface;
  final Color entertainmentHover;
  final Color entertainmentPressed;

  final Color store;
  final Color storeSubdued;
  final Color storeSurface;
  final Color storeOnSurface;
  final Color storeHover;
  final Color storePressed;

  final Color platinum;
  final Color platinumSubdued;
  final Color platinumSurface;
  final Color platinumOnSurface;
  final Color platinumHover;
  final Color platinumPressed;

  final Color gold;
  final Color goldSubdued;
  final Color goldSurface;
  final Color goldOnSurface;
  final Color goldHover;
  final Color goldPressed;

  final Color emerald;
  final Color emeraldSubdued;
  final Color emeraldSurface;
  final Color emeraldOnSurface;
  final Color emeraldHover;
  final Color emeraldPressed;

  final Color customer;
  final Color customerSubdued;
  final Color customerSurface;
  final Color customerOnSurface;
  final Color customerHover;
  final Color customerPressed;

  final Color success;
  final Color successSubdued;
  final Color successSurface;
  final Color successOnSurface;
  final Color successHover;
  final Color successPressed;

  final Color warning;
  final Color warningSubdued;
  final Color warningSurface;
  final Color warningOnSurface;
  final Color warningHover;
  final Color warningPressed;

  final Color error;
  final Color errorSubdued;
  final Color errorSurface;
  final Color errorOnSurface;
  final Color errorHover;
  final Color errorPressed;

  final Color start;
  final Color startSubdued;
  final Color startSurface;
  final Color startOnSurface;
  final Color startHover;
  final Color startPressed;

  final Color notification;
  final Color notificationSubdued;
  final Color notificationSurface;
  final Color notificationOnSurface;
  final Color notificationHover;
  final Color notificationPressed;

  final Color fbb;
  final Color fbbSubdued;
  final Color fbbSurface;
  final Color fbbOnSurface;
  final Color fbbHover;
  final Color fbbPressed;

  final Color text;
  final Color textSubdued;
  final Color textDisabled;

  final Color black;
  final Color white;
  final Color backgroundMain;
  final Color backgroundDisabled;
  final Color divider;
  final Color surface;

  @override
  ChmThemeColors copyWith() {
    //TODO: if implement copy with, must change declaration to nullable.
    throw UnimplementedError();
  }

  @override
  ChmThemeColors lerp(ChmThemeColors? other, double t) {
    //TODO
    return this;
  }
}
