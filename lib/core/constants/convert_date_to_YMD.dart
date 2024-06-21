// ignore: file_names
import 'package:intl/intl.dart';

String convertDateToYMD(DateTime? date) {
  if (date == null) {
    return '';
  }
  var formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}

DateTime convertYMDtoDate(String? date) {
  if (date == null) {
    return DateTime.now();
  }
  var formatter = DateFormat('yyyy-MM-dd');
  return formatter.parse(date);
}
