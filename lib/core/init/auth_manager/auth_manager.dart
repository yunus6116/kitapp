import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../global_models/public_user/public_user_model.dart';
import '../../global_providers/global_providers.dart';
import '../../services/registration_services.dart';

class AuthManager extends ChangeNotifier {
  final Ref ref;
  User? currentOnlineUser;
  PublicUser? currentUserModel;

  AuthManager(this.ref);

  void setCurrentOnlineUser(User? currentUser) {
    currentOnlineUser = currentUser;
    notifyListeners();
  }

  void setCurrentUserModel(PublicUser? userModel) {
    currentUserModel = userModel;
    notifyListeners();
  }
}

final authManagerProvider = ChangeNotifierProvider((ref) => AuthManager(ref));

final authStateChangesProvider = StreamProvider<User?>((ref) async* {
  final auth = ref.read(authProvider);
  await for (final value in auth.authStateChanges()) {
    ref.read(authManagerProvider).setCurrentOnlineUser(value);
    if (value != null) {
      final userModel = await ref
          .read(registrationServicesProvider)
          .getCurrentUser(value.uid);
      ref.read(authManagerProvider).setCurrentUserModel(userModel);
    } else {
      ref.read(authManagerProvider).setCurrentUserModel(null);
    }
    yield value;
  }
});

///Triggers if a user's attribute changes
final userChangesProvider = StreamProvider.autoDispose<PublicUser>((ref) {
  final currentUserModel =
      ref.watch(authManagerProvider.select((value) => value.currentUserModel));
  final stream = ref
      .read(registrationServicesProvider)
      .listenUserChanges(currentUserModel!.uid!);
  return stream.map((snapshot) {
    final userModel = PublicUser.fromJson(snapshot.data());
    ref.read(authManagerProvider).setCurrentUserModel(userModel);
    return userModel;
  });
});
