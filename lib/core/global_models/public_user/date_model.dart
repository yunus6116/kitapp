import 'package:cloud_firestore/cloud_firestore.dart';

class Date {
  static DateTime fromJson(String? date) {
    return date != null && date != 'null'
        ? DateTime.fromMicrosecondsSinceEpoch(int.parse(date))
        : DateTime.now();
  }

  static DateTime? fromDocumentSnapshot(Timestamp? date) {
    return date?.toDate();
  }

  static DateTime fromEsSnapshot(Map<String, dynamic>? date) {
    return date != null
        ? Timestamp(date.cast<String, dynamic>()['_seconds'],
                date.cast<String, dynamic>()['_nanoseconds'])
            .toDate()
        : DateTime.now();
  }

  static String toJson(DateTime date) {
    return date.microsecondsSinceEpoch.toString();
  }

  static DateTime? toPostJson(DateTime? date) {
    return date;
  }
}
