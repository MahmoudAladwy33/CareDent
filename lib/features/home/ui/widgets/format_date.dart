import 'package:intl/intl.dart';

String formatDate(String dateString) {
  final dateTime = DateTime.parse(dateString);
  final formatter = DateFormat('MMMM d, y'); 
  return formatter.format(dateTime);
}
