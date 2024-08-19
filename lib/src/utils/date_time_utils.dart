import 'package:intl/intl.dart';

String getDateFullFormatByLang(DateTime dateTime, String lang,
    [String? dateFormat]) {
  final localeCode = lang == 'th' ? 'th_TH' : 'en_US';

  String defaultDisplay =
      DateFormat(dateFormat ?? "d MMM yyyy", localeCode).format(dateTime);

  int year = dateTime.year;
  int buddhistYear = year + 543;

  if (localeCode == 'th_TH') {
    return defaultDisplay.replaceFirst(
        year.toString(), buddhistYear.toString());
  } else {
    return defaultDisplay;
  }
}
