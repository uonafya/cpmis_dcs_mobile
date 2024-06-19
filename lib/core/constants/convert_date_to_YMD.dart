// ignore: file_names
import 'package:intl/intl.dart';

String convertDateToYMD(DateTime date) {
  var formatter = DateFormat('yyyy-MMM-dd');
  return formatter.format(date);
}
