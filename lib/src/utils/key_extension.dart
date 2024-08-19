import 'package:flutter/widgets.dart';

extension GetStringValue on Key? {
  String get stringValue {
    if (this != null) {
      String? unTrimmedKey = this.toString();
      // Use a regular expression to find the desired pattern
      RegExp pattern = RegExp(r"<'(.*?)'>");
      Match? match = pattern.firstMatch(unTrimmedKey);

      // If a match is found, return the matched group; otherwise, return the original input
      return match?.group(1) ?? unTrimmedKey;
    } else {
      return 'null';
    }
  }
}
