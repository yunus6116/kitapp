import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kitapp/core/global_models/date_model.dart';

import 'verify_status_model.dart';

class PublicUser {
  String? uid;
  String? email;
  String? username;
  String? firstName;
  String? lastName;
  String? bio;
  String? profilePicture;
  Timestamp? joinedAt;
  Timestamp? modifiedAt;
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
    String? firstName,
    String? lastName,
    String? bio,
    String? profilePicture,
    Timestamp? joinedAt,
    Timestamp? modifiedAt,
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
      "joined_at": Date.fromDocumentSnapshot(joinedAt),
      "modified_at": Date.fromDocumentSnapshot(modifiedAt),
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
      joinedAt: map["joined_at"],
      modifiedAt: map["modified_at"],
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
      joinedAt: Timestamp.fromDate(DateTime.now()),
      modifiedAt: Timestamp.fromDate(DateTime.now()),
      bio: '',
    );
  }
}
