// ignore: file_names
import 'package:intl/intl.dart';

String convertDateToYMD(DateTime date) {
  var formatter = DateFormat('yyyy-MMM-dd');
  return formatter.format(date);
}

DateTime convertYMDtoData(String date) {
  var formatter = DateFormat('yyyy-MMM-dd');
  return formatter.parse(date);
}
