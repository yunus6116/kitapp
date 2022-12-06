import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String get formatDateWithDots {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(this);
  }

  String get formatDateWithSlash {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}
