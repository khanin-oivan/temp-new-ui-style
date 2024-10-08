import 'package:flutter/material.dart';

class MyaTextStyle extends ThemeExtension<MyaTextStyle> {
  MyaTextStyle({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLargeRegular,
    required this.bodyLargeMedium,
    required this.bodyLargeBold,
    required this.bodyMediumRegular,
    required this.bodyMediumMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
  });

  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLargeRegular;
  final TextStyle bodyLargeMedium;
  final TextStyle bodyLargeBold;
  final TextStyle bodyMediumRegular;
  final TextStyle bodyMediumMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  @override
  MyaTextStyle copyWith() {
    //TODO: if implement copy with, must change declaration to nullable.
    throw UnimplementedError();
  }

  @override
  MyaTextStyle lerp(MyaTextStyle? other, double t) {
    //TODO
    return this;
  }
}
