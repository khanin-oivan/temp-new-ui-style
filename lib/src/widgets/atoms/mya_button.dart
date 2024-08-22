import 'dart:async';

import 'package:flutter/material.dart';
import 'package:temp_new_ui_style/src/themes/colors/mya_theme_colors.dart';
import 'package:temp_new_ui_style/src/themes/text_styles/mya_text_style.dart';
import 'package:temp_new_ui_style/src/utils/enum.dart';
import 'package:temp_new_ui_style/temp_new_ui_style.dart';

class ChmButtonCountdown extends StatefulWidget {
  const ChmButtonCountdown({
    super.key,
    required this.label,
    required this.onPressed,
    this.style = MyaButtonStyle.filled,
    this.size = MyaButtonSize.large,
    this.theme = MyaButtonTheme.primary,
    this.leadingIconKey,
    this.trailingIconKey,
    this.width,
  });

  final MyaButtonTheme theme;
  final MyaButtonStyle style;
  final MyaButtonSize size;
  final Function()? onPressed;
  final String label;
  final String? leadingIconKey;
  final String? trailingIconKey;
  final double? width;

  @override
  State<ChmButtonCountdown> createState() => _ChmButtonCountdownState();
}

class _ChmButtonCountdownState extends State<ChmButtonCountdown> {
  late bool isLargeButton;
  late double iconSize;
  bool isDisable = false;
  bool isPressed = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    isLargeButton = widget.size == MyaButtonSize.large;
    iconSize = isLargeButton ? 24 : 16;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MyaTextStyle myaTextStyle = context.myaTextStyle;
    final MyaThemeColors myaColors = context.myaThemeColors;

    final Set<WidgetState> states = isDisable
        ? {WidgetState.disabled}
        : isPressed
            ? {WidgetState.pressed}
            : {};

    final ButtonStyle buttonStyle =
        _getButtonStyle(widget.style, isLargeButton, widget.width);

    final Color? foregroundColor = buttonStyle.foregroundColor!.resolve(states);

    return GestureDetector(
      //Need gesture detector because ChmIcon() does not inherit MaterialPropertyState, like Icon() in Flutter.
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: ElevatedButton(
        onPressed: isDisable ? null : widget.onPressed,
        style: buttonStyle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.leadingIconKey != null)
              Padding(
                padding: EdgeInsets.only(left: isLargeButton ? 16 : 12),
                child: Icon(
                  Icons.circle_rounded,
                  size: iconSize,
                  color: foregroundColor,
                ),
                // child: ChmIcon(
                //   keyIconName: widget.leadingIconKey as String,
                //   color: foregroundColor,
                //   width: iconSize,
                //   height: iconSize,
                // ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isLargeButton ? 16 : 8),
              child: Text(
                widget.label,
                style: myaTextStyle.bodyLargeBold,
              ),
            ),
            if (widget.trailingIconKey != null)
              Padding(
                padding: EdgeInsets.only(right: isLargeButton ? 16 : 12),
                child: Icon(
                  Icons.circle_rounded,
                  size: iconSize,
                  color: foregroundColor,
                ),
                // child: ChmIcon(
                //   keyIconName: widget.trailingIconKey as String,
                //   color: foregroundColor,
                //   width: iconSize,
                //   height: iconSize,
                // ),
              ),
          ],
        ),
      ),
    );
  }
}

ButtonStyle _getButtonStyle(
    MyaButtonStyle style, bool isLargeButton, double? width) {
  final commonButtonStyle = ButtonStyle(
    padding: WidgetStateProperty.all(EdgeInsets.zero),
    splashFactory: NoSplash.splashFactory,
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    elevation: WidgetStateProperty.all(0),
    animationDuration: Duration.zero,
    minimumSize:
        WidgetStateProperty.all(Size(width ?? 100, isLargeButton ? 48 : 32)),
  );

  final commonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(isLargeButton ? 16 : 10),
  );

  switch (style) {
    case (MyaButtonStyle.filled):
      return commonButtonStyle.copyWith(
        shape: WidgetStateProperty.all(commonShape),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          // Color of text and icon
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return BaseColors.textDisable;
            }
            if (states.contains(WidgetState.pressed) ||
                states.contains(WidgetState.hovered)) {
              return BaseColors.whiteColor;
            }
            return BaseColors
                .allPrimaryPrimary10; // Defer to the widget's default.
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return BaseColors.disableBackground;
            }
            if (states.contains(WidgetState.hovered)) {
              return BaseColors.primaryHover;
            }
            if (states.contains(WidgetState.pressed)) {
              return BaseColors.primaryPressed;
            }
            return BaseColors.primaryPrimary; // Defer to the widget's default.
          },
        ),
      );
    case (MyaButtonStyle.outlined):
      return commonButtonStyle.copyWith(
        shape: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return commonShape.copyWith(
                side:
                    const BorderSide(width: 1, color: BaseColors.textDisable));
          }
          if (states.contains(WidgetState.pressed)) {
            return commonShape.copyWith(
                side: const BorderSide(
                    width: 1, color: BaseColors.primaryPressed));
          }
          if (states.contains(WidgetState.hovered)) {
            return commonShape.copyWith(
                side:
                    const BorderSide(width: 1, color: BaseColors.primaryHover));
          }
          return commonShape.copyWith(
              side: const BorderSide(
                  width: 1, color: BaseColors.allPrimaryPrimary10));
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          // Color of text and icon
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return BaseColors.textDisable;
            }
            if (states.contains(WidgetState.pressed)) {
              return BaseColors.primaryPressed;
            }

            if (states.contains(WidgetState.hovered)) {
              return BaseColors.primaryHover;
            }
            return BaseColors
                .allPrimaryPrimary10; // Defer to the widget's default.
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return BaseColors.surfacelight5;
            }
            return BaseColors.whiteColor; // Defer to the widget's default.
          },
        ),
      );
    case (MyaButtonStyle.text):
      return commonButtonStyle.copyWith(
        shape: WidgetStateProperty.all(commonShape),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          // Color of text and icon
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return BaseColors.textDisable;
            }
            if (states.contains(WidgetState.pressed)) {
              return BaseColors.primaryPressed;
            }

            if (states.contains(WidgetState.hovered)) {
              return BaseColors.primaryHover;
            }
            return BaseColors
                .allPrimaryPrimary10; // Defer to the widget's default.
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return BaseColors.transparent; // Defer to the widget's default.
          },
        ),
      );
    case (MyaButtonStyle.elevated):
      return commonButtonStyle.copyWith(
        elevation: WidgetStateProperty.resolveWith<double?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return 0;
            }

            return 2;
          },
        ),
        shape: WidgetStateProperty.all(commonShape),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          // Color of text and icon
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return BaseColors.textDisable;
            }
            if (states.contains(WidgetState.pressed) ||
                states.contains(WidgetState.hovered)) {
              return BaseColors.whiteColor;
            }
            return BaseColors
                .allPrimaryPrimary10; // Defer to the widget's default.
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return BaseColors.disableBackground;
            }
            if (states.contains(WidgetState.hovered)) {
              return BaseColors.primaryHover;
            }
            if (states.contains(WidgetState.pressed)) {
              return BaseColors.primaryPressed;
            }
            return BaseColors.primaryPrimary; // Defer to the widget's default.
          },
        ),
      );
  }
}

String _formatDuration(int seconds) {
  final Duration duration = Duration(seconds: seconds);
  final int minutes = duration.inMinutes;
  final int remainingSeconds = duration.inSeconds % 60;
  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
}
