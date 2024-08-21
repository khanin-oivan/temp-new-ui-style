import 'dart:async';

import 'package:flutter/material.dart';
import 'package:temp_new_ui_style/src/utils/enum.dart';

class ChmButtonCountdown extends StatefulWidget {
  const ChmButtonCountdown({
    super.key,
    required this.label,
    required this.onPressed,
    this.style = MyaButtonStyle.filled,
    this.size = MyaButtonSize.large,
    this.leadingIconKey,
    this.trailingIconKey,
    this.cdSeconds = 0,
    this.width,
    this.hideLabelWhenCount = false,
    this.countWhenInit = true,
  }) : assert(cdSeconds >= 0, 'cdSeconds must be greater than or equal to 0');

  final MyaButtonTheme theme = MyaButtonTheme.primary;
  final MyaButtonStyle style;
  final MyaButtonSize size;
  final Future<bool?> Function()? onPressed;
  final String label;
  final String? leadingIconKey;
  final String? trailingIconKey;
  final int cdSeconds;
  final double? width;
  final bool hideLabelWhenCount;
  final bool countWhenInit;

  @override
  State<ChmButtonCountdown> createState() => _ChmButtonCountdownState();
}

class _ChmButtonCountdownState extends State<ChmButtonCountdown> {
  late bool isLargeButton;
  late double iconSize;
  bool isDisable = false;
  bool isPressed = false;
  bool isCounting = false;
  int remainingSeconds = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    setState(() {
      isDisable = true; //handle loading before countdown
      isCounting = true;
      remainingSeconds = widget.cdSeconds;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
          if (remainingSeconds == 0) {
            isCounting = false;
            isDisable = false;
            timer.cancel();
          }
        }
      });
    });
  }

  @override
  void initState() {
    if (widget.cdSeconds > 0 && widget.countWhenInit) startCountdown();
    isLargeButton = widget.size == MyaButtonSize.large;
    iconSize = isLargeButton ? 24 : 16;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Set<MaterialState> states = isDisable
        ? {MaterialState.disabled}
        : isPressed
            ? {MaterialState.pressed}
            : {};

    final ButtonStyle buttonStyle =
        _getButtonStyle(widget.style, isLargeButton, widget.width);

    final Color? foregroundColor = buttonStyle.foregroundColor!.resolve(states);

    bool shouldShowLabel = !(widget.hideLabelWhenCount && isCounting);

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
        onPressed: isDisable
            ? null
            : () async {
                setState(() {
                  isDisable = true; //handle loading before countdown
                });
                bool? isSuccess = await widget.onPressed!();
                isSuccess = isSuccess ?? false;

                if (isSuccess == false && widget.cdSeconds > 0) {
                  startCountdown();
                } else {
                  setState(() {
                    isDisable = false; //handle loading before countdown
                  });
                }
              },
        style: buttonStyle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.leadingIconKey != null)
              Padding(
                padding: EdgeInsets.only(left: isLargeButton ? 16 : 12),
                child: ChmIcon(
                  keyIconName: widget.leadingIconKey as String,
                  color: foregroundColor,
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isLargeButton ? 16 : 8),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: isLargeButton
                      ? BaseTextStyle.bodyBold.copyWith(color: foregroundColor)
                      : BaseTextStyle.bodyMediumBold
                          .copyWith(color: foregroundColor),
                  children: [
                    if (shouldShowLabel) TextSpan(text: widget.label),
                    if (shouldShowLabel || remainingSeconds > 0)
                      const TextSpan(text: ' '),
                    if (remainingSeconds > 0)
                      shouldShowLabel
                          ? TextSpan(
                              text: '(${_formatDuration(remainingSeconds)})',
                            )
                          : TextSpan(
                              text: _formatDuration(remainingSeconds),
                            ),
                  ],
                ),
              ),
            ),
            if (widget.trailingIconKey != null)
              Padding(
                padding: EdgeInsets.only(right: isLargeButton ? 16 : 12),
                child: ChmIcon(
                  keyIconName: widget.trailingIconKey as String,
                  color: foregroundColor,
                  width: iconSize,
                  height: iconSize,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

ButtonStyle _getButtonStyle(
    StyleButton style, bool isLargeButton, double? width) {
  final commonButtonStyle = ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    splashFactory: NoSplash.splashFactory,
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    elevation: MaterialStateProperty.all(0),
    animationDuration: Duration.zero,
    minimumSize:
        MaterialStateProperty.all(Size(width ?? 100, isLargeButton ? 48 : 32)),
  );

  final commonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(isLargeButton ? 16 : 10),
  );

  switch (style) {
    case (StyleButton.filled):
      return commonButtonStyle.copyWith(
        shape: MaterialStateProperty.all(commonShape),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          // Color of text and icon
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BaseColors.textDisable;
            }
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.hovered)) {
              return BaseColors.whiteColor;
            }
            return BaseColors
                .allPrimaryPrimary10; // Defer to the widget's default.
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BaseColors.disableBackground;
            }
            if (states.contains(MaterialState.hovered)) {
              return BaseColors.primaryHover;
            }
            if (states.contains(MaterialState.pressed)) {
              return BaseColors.primaryPressed;
            }
            return BaseColors.primaryPrimary; // Defer to the widget's default.
          },
        ),
      );
    case (StyleButton.outlined):
      return commonButtonStyle.copyWith(
        shape: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return commonShape.copyWith(
                side:
                    const BorderSide(width: 1, color: BaseColors.textDisable));
          }
          if (states.contains(MaterialState.pressed)) {
            return commonShape.copyWith(
                side: const BorderSide(
                    width: 1, color: BaseColors.primaryPressed));
          }
          if (states.contains(MaterialState.hovered)) {
            return commonShape.copyWith(
                side:
                    const BorderSide(width: 1, color: BaseColors.primaryHover));
          }
          return commonShape.copyWith(
              side: const BorderSide(
                  width: 1, color: BaseColors.allPrimaryPrimary10));
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          // Color of text and icon
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BaseColors.textDisable;
            }
            if (states.contains(MaterialState.pressed)) {
              return BaseColors.primaryPressed;
            }

            if (states.contains(MaterialState.hovered)) {
              return BaseColors.primaryHover;
            }
            return BaseColors
                .allPrimaryPrimary10; // Defer to the widget's default.
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return BaseColors.surfacelight5;
            }
            return BaseColors.whiteColor; // Defer to the widget's default.
          },
        ),
      );
    case (StyleButton.text):
      return commonButtonStyle.copyWith(
        shape: MaterialStateProperty.all(commonShape),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          // Color of text and icon
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BaseColors.textDisable;
            }
            if (states.contains(MaterialState.pressed)) {
              return BaseColors.primaryPressed;
            }

            if (states.contains(MaterialState.hovered)) {
              return BaseColors.primaryHover;
            }
            return BaseColors
                .allPrimaryPrimary10; // Defer to the widget's default.
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return BaseColors.transparent; // Defer to the widget's default.
          },
        ),
      );
    case (StyleButton.elevated):
      return commonButtonStyle.copyWith(
        elevation: MaterialStateProperty.resolveWith<double?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return 0;
            }

            return 2;
          },
        ),
        shape: MaterialStateProperty.all(commonShape),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          // Color of text and icon
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BaseColors.textDisable;
            }
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.hovered)) {
              return BaseColors.whiteColor;
            }
            return BaseColors
                .allPrimaryPrimary10; // Defer to the widget's default.
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BaseColors.disableBackground;
            }
            if (states.contains(MaterialState.hovered)) {
              return BaseColors.primaryHover;
            }
            if (states.contains(MaterialState.pressed)) {
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
