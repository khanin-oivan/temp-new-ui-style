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

    final ButtonStyle buttonStyle = _getButtonStyle(
        style: widget.style,
        isLargeButton: isLargeButton,
        width: widget.width,
        colors: myaColors,
        theme: widget.theme);

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
      child: Opacity(
        opacity: isDisable ? 0.5 : 1.0,
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
                padding:
                    EdgeInsets.symmetric(horizontal: isLargeButton ? 16 : 8),
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
      ),
    );
  }
}

ButtonStyle _getButtonStyle({
  required MyaButtonStyle style,
  required bool isLargeButton,
  double? width,
  required MyaThemeColors colors,
  required MyaButtonTheme theme,
}) {
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

  switch (theme) {
    case (MyaButtonTheme.primary):
      switch (style) {
        case (MyaButtonStyle.filled):
          return commonButtonStyle.copyWith(
            shape: WidgetStateProperty.all(commonShape),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors
                    .primaryOnPrimary; // Defer to the widget's default.
              },
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.primaryPressed;
                }
                return colors.primaryPrimary; // Defer to the widget's default.
              },
            ),
          );

        case (MyaButtonStyle.tonalFilled):
          return commonButtonStyle.copyWith(
            shape: WidgetStateProperty.all(commonShape),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors
                    .primaryOnPrimary; // Defer to the widget's default.
              },
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.secondaryPressed;
                }
                return colors
                    .secondarySecondary; // Defer to the widget's default.
              },
            ),
          );

        case (MyaButtonStyle.outlined):
          return commonButtonStyle.copyWith(
            shape: WidgetStateProperty.resolveWith((states) {
              return commonShape.copyWith(
                  side: BorderSide(width: 1, color: colors.secondaryOnSurface));
            }),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                return colors
                    .secondaryOnSurface; // Defer to the widget's default.
              },
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.secondaryPressed;
                }
                return colors.white; // Defer to the widget's default.
              },
            ),
          );
        case (MyaButtonStyle.text):
          return commonButtonStyle.copyWith(
            shape: WidgetStateProperty.all(commonShape),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors
                    .primaryOnSurface; // Defer to the widget's default.
              },
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.primarySurface;
                }

                return colors.white; // Defer to the widget's default.
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
                return colors
                    .primaryOnPrimary; // Defer to the widget's default.
              },
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.primaryPressed;
                }
                return colors.primaryPrimary; // Defer to the widget's default.
              },
            ),
          );
      }
    case (MyaButtonTheme.warning):
      switch (style) {
        case (MyaButtonStyle.filled):
        case (MyaButtonStyle.tonalFilled): // Not available in design
        case (MyaButtonStyle.outlined): // Not available in design
          return commonButtonStyle.copyWith(
            shape: WidgetStateProperty.all(commonShape),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.warningPressed;
                }
                return colors.warningWarning; // Defer to the widget's default.
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors
                    .warningOnWarning; // Defer to the widget's default.
              },
            ),
          );

        case (MyaButtonStyle.text):
          return commonButtonStyle.copyWith(
            shape: WidgetStateProperty.all(commonShape),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.warningSurface;
                }

                return colors.transparent; // Defer to the widget's default.
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors
                    .warningOnSurface; // Defer to the widget's default.
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
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.warningPressed;
                }
                return colors.warningWarning; // Defer to the widget's default.
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors
                    .warningOnWarning; // Defer to the widget's default.
              },
            ),
          );
      }
    case (MyaButtonTheme.error):
      switch (style) {
        case (MyaButtonStyle.filled):
        case (MyaButtonStyle.tonalFilled): // Not available in design
        case (MyaButtonStyle.outlined): // Not available in design
          return commonButtonStyle.copyWith(
            shape: WidgetStateProperty.all(commonShape),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.errorPressed;
                }
                return colors.errorError; // Defer to the widget's default.
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors.errorOnError; // Defer to the widget's default.
              },
            ),
          );

        case (MyaButtonStyle.text):
          return commonButtonStyle.copyWith(
            shape: WidgetStateProperty.all(commonShape),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.errorSurface;
                }

                return colors.transparent; // Defer to the widget's default.
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors.errorOnSurface; // Defer to the widget's default.
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
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.errorPressed;
                }
                return colors.errorError; // Defer to the widget's default.
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors.errorOnError; // Defer to the widget's default.
              },
            ),
          );
      }
    case (MyaButtonTheme.success):
      switch (style) {
        case (MyaButtonStyle.filled):
        case (MyaButtonStyle.tonalFilled): // Not available in design
        case (MyaButtonStyle.outlined): // Not available in design
          return commonButtonStyle.copyWith(
            shape: WidgetStateProperty.all(commonShape),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.successPressed;
                }
                return colors.successSuccess; // Defer to the widget's default.
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors
                    .successOnSuccess; // Defer to the widget's default.
              },
            ),
          );

        case (MyaButtonStyle.text):
          return commonButtonStyle.copyWith(
            shape: WidgetStateProperty.all(commonShape),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.successSurface;
                }

                return colors.transparent; // Defer to the widget's default.
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors
                    .successOnSurface; // Defer to the widget's default.
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
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return colors.successPressed;
                }
                return colors.successSuccess; // Defer to the widget's default.
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              // Color of text and icon
              (Set<WidgetState> states) {
                return colors
                    .successOnSuccess; // Defer to the widget's default.
              },
            ),
          );
      }
  }
}
