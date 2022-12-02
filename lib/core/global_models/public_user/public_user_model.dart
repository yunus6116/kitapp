import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

import 'verify_status_model.dart';

class PublicUser {
  String? uid;
  String? email;
  String? username;
  String? firstName;
  String? lastName;
  String? bio;
  String? profilePicture;
  DateTime? joinedAt;
  DateTime? modifiedAt;
  VerifyStatus? verifyStatus;
  bool? isAgreedTerms;
  PublicUser({
    this.uid,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.bio,
    this.profilePicture,
    this.joinedAt,
    this.modifiedAt,
    this.verifyStatus,
    this.isAgreedTerms,
  });

  PublicUser copyWith({
    String? uid,
    String? email,
    String? username,
    String? phone,
    String? firstName,
    String? lastName,
    String? bio,
    String? profilePicture,
    DateTime? joinedAt,
    DateTime? modifiedAt,
    VerifyStatus? verifyStatus,
    bool? isAgreedTerms,
  }) {
    return PublicUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      bio: bio ?? this.bio,
      profilePicture: profilePicture ?? this.profilePicture,
      joinedAt: joinedAt ?? this.joinedAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      verifyStatus: verifyStatus ?? this.verifyStatus,
      isAgreedTerms: isAgreedTerms ?? this.isAgreedTerms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'bio': bio,
      'profilePicture': profilePicture,
      'joinedAt': joinedAt?.millisecondsSinceEpoch,
      'modifiedAt': modifiedAt?.millisecondsSinceEpoch,
      'verify_status': verifyStatus?.toMap(),
      'isAgreedTerms': isAgreedTerms,
    };
  }

  factory PublicUser.fromMap(Map<String, dynamic> map) {
    return PublicUser(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      bio: map['bio'],
      profilePicture: map['profilePicture'],
      joinedAt: map['joinedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['joinedAt'])
          : null,
      modifiedAt: map['modifiedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['modifiedAt'])
          : null,
      verifyStatus: map['verify_status'] != null
          ? VerifyStatus.fromMap(map['verify_status'])
          : null,
      isAgreedTerms: map['isAgreedTerms'],
    );
  }
  factory PublicUser.fromUserCredential(
    User user,
    PublicUser? publicUser,
  ) {
    var rng = Random();
    return PublicUser(
      email: publicUser?.email ?? user.providerData[0].email,
      isAgreedTerms: publicUser?.isAgreedTerms ?? true,
      profilePicture: publicUser?.profilePicture ?? user.photoURL,
      firstName: publicUser?.firstName ?? 'User',
      lastName: publicUser?.lastName ?? '',
      uid: user.uid,
      username: publicUser?.firstName != null
          ? '${publicUser?.firstName} ${publicUser?.lastName?[0]}.'
          : 'User${rng.nextInt(10000)}',
      verifyStatus: publicUser?.verifyStatus ?? VerifyStatus(),
      joinedAt: user.metadata.creationTime,
      modifiedAt: user.metadata.creationTime,
      bio: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicUser.fromJson(String source) =>
      PublicUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PublicUser(uid: $uid, email: $email, username: $username,firstName: $firstName, lastName: $lastName, bio: $bio, profilePicture: $profilePicture, joinedAt: $joinedAt, modifiedAt: $modifiedAt, verifyStatus: $verifyStatus, isAgreedTerms: $isAgreedTerms)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PublicUser &&
        other.uid == uid &&
        other.email == email &&
        other.username == username &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.bio == bio &&
        other.profilePicture == profilePicture &&
        other.joinedAt == joinedAt &&
        other.modifiedAt == modifiedAt &&
        other.verifyStatus == verifyStatus &&
        other.isAgreedTerms == isAgreedTerms;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        username.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        bio.hashCode ^
        profilePicture.hashCode ^
        joinedAt.hashCode ^
        modifiedAt.hashCode ^
        verifyStatus.hashCode ^
        isAgreedTerms.hashCode;
  }
}
