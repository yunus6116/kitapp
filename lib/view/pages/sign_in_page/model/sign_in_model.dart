enum SignInFieldType { mail, password }

class SignInModel {
  String mail;
  String password;

//<editor-fold desc="Data Methods">

  SignInModel({
    this.mail = "",
    this.password = "",
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignInModel &&
          runtimeType == other.runtimeType &&
          mail == other.mail &&
          password == other.password);

  @override
  int get hashCode => mail.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'SignInModel{' ' mail: $mail,' ' password: $password,' '}';
  }

  SignInModel copyWith({
    String? mail,
    String? password,
  }) {
    return SignInModel(
      mail: mail ?? this.mail,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mail': mail,
      'password': password,
    };
  }

  factory SignInModel.fromMap(Map<String, dynamic> map) {
    return SignInModel(
      mail: map['mail'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}
