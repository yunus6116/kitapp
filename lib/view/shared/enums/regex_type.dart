enum RegexType {
  eMail,
  onlyNumber,
  phoneNumber,
}

extension RegexTypeExtension on RegexType {
  RegExp get regex {
    switch (this) {
      case RegexType.eMail:
        return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      case RegexType.onlyNumber:
        return RegExp("[0-9]");
      case RegexType.phoneNumber:
        return RegExp(r'(^\+[1-9]{1}[0-9]{3,14}$)');
    }
  }
}
