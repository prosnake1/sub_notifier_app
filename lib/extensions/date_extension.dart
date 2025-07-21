import 'package:intl/intl.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';

extension DateFormatting on DateTime {
  String toLocalDate() => DateFormat.yMMMd(t.lang).format(this);
}
