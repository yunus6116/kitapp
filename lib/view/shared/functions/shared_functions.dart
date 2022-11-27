import 'dart:math';

class SharedFunctions {
  static String generateNonceForAppleSignIn([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  static bool isRangeValid(List<DateTime> reservedDates, DateTime startDate, DateTime endDate) {
    for (var reservedDate in reservedDates) {
      if (startDate.isBefore(reservedDate) && endDate.isAfter(reservedDate)) {
        return false;
      }
    }
    return true;
  }
}
