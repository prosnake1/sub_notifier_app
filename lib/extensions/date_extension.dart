import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toLocalDate() => DateFormat.yMMMMEEEEd('ru').format(this);
}
