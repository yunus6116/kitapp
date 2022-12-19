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

  String get formatDateUSA {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }
}
