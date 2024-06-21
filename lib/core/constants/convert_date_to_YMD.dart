// ignore: file_names
import 'package:intl/intl.dart';

String convertDateToYMD(DateTime? date) {
  if (date == null) {
    return "";
  }
  var formatter = DateFormat('yyyy-MMM-dd');
  return formatter.format(date);
}
