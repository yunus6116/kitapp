import 'package:kitapp/core/extensions/string_extensions.dart';
import 'package:kitapp/core/global_models/public_user/verify_status_model.dart';

import '../../view/shared/functions/shared_functions.dart';
import '../enums/collection_name.dart';
import '../global_models/public_user/public_user_model.dart';
import '../init/auth_manager/auth_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../global_providers/global_providers.dart';

abstract class IRegistrationServices {
  final String appleProviderId = "apple.com";
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> signInWithApple();

  Future<UserCredential> signInWithMail(String mail, String password);
  Future<UserCredential> creatUserWithEmailAndPassword(
      {required String mail, required String password});
  // Future<void> createUserIntoFireStore(
  //     {required User user, LoginType? loginType});
  Future<PublicUser?> getCurrentUser(String uid);
  Future<void> signOut();
  Future<void> resetPassword({required String eMail});
  Future<void> sendEmailVerification({required User user});
  Future<void> updateUserIsEmailVerifiedIntoFireStore(
      {required UserCredential userCredential});
  Future<void> updateUserData(String userId, Map<String, dynamic> body,
      {bool isPhoto = false});
  Stream listenUserChanges(String id);
  Future<void> deleteAccount();
}

class RegistrationServices extends IRegistrationServices {
  late FirebaseFirestore _fireStore;
  late FirebaseAuth _firebaseAuth;
  late CollectionReference _usersRef;
  final Ref ref;

  RegistrationServices(this.ref) {
    _fireStore = ref.read(fireStoreProvider);
    _firebaseAuth = ref.read(authProvider);
    _usersRef = _fireStore.collection(CollectionName.users.collectionName);
  }

  String get _appleProviderId => super.appleProviderId;

  GoogleSignIn get _googleSignIn => super.googleSignIn;

  @override
  Future<UserCredential> signInWithApple() async {
    PublicUser publicUser;
    try {
      final rawNonce = SharedFunctions.generateNonceForAppleSignIn();
      final nonce = rawNonce.sha256OfString;
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      final oauthCredential = OAuthProvider(_appleProviderId).credential(
        idToken: credential.identityToken,
        rawNonce: rawNonce,
      );
      final authResult =
          await _firebaseAuth.signInWithCredential(oauthCredential);
      var res = await getCurrentUser(authResult.user!.uid);
      if (res != null) {
        publicUser = res;
        ref.read(authManagerProvider).setCurrentOnlineUser(authResult.user);
        ref.read(authManagerProvider).setCurrentUserModel(publicUser);
      } else {
        // createUserIntoFireStore(
        //     user: authResult.user, loginType: LoginType.apple);
      }
      return authResult;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      PublicUser publicUser;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final authResult = await _firebaseAuth.signInWithCredential(credential);
      User? firebaseUser = authResult.user;
      var res = await getCurrentUser(firebaseUser!.uid);
      if (res != null) {
        publicUser = res;
        ref.read(authManagerProvider).setCurrentOnlineUser(firebaseUser);
        ref.read(authManagerProvider).setCurrentUserModel(publicUser);
      } else {
        // createUserIntoFireStore(
        //     user: authResult.user, loginType: LoginType.google);
      }
      return authResult;
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<void> createUserIntoFireStore({
  //   required User? user,
  //   LoginType? loginType,
  // }) async {
  //   try {
  //     PublicUser? publicUser = ref.read(signUpVMProvider).publicUser;
  //     DocumentReference documentReference = _fireStore
  //         .collection(CollectionName.users.collectionName)
  //         .doc(user!.uid);
  //     PublicUser publicUserToFireStore =
  //         PublicUser.fromUserCredential(user, loginType, publicUser);
  //     ref.read(authManagerProvider).setCurrentOnlineUser(user);
  //     ref.read(authManagerProvider).setCurrentUserModel(publicUserToFireStore);
  //     await documentReference.set(publicUserToFireStore.toMap());
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<void> signOut() async {
    GoogleSignInAccount? currentGoogleUser = _googleSignIn.currentUser;
    User? currentFirebaseUser = _firebaseAuth.currentUser;
    if (currentGoogleUser != null) {
      await _googleSignIn.signOut();
    }
    if (currentFirebaseUser != null) {
      await _firebaseAuth.signOut();
    }
  }

  @override
  Future<UserCredential> signInWithMail(String mail, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: mail, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PublicUser?> getCurrentUser(String uid) async {
    try {
      final snapshot = await _usersRef.doc(uid).get();
      if (snapshot.data() != null) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return PublicUser.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> resetPassword({required String eMail}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: eMail);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendEmailVerification({required User user}) async {
    try {
      await user.sendEmailVerification();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserIsEmailVerifiedIntoFireStore(
      {required UserCredential userCredential}) async {
    try {
      DocumentReference documentReference = _fireStore
          .collection(CollectionName.users.collectionName)
          .doc(userCredential.user!.uid);
      PublicUser? currentUser = await getCurrentUser(userCredential.user!.uid);
      VerifyStatus verifyStatus = VerifyStatus(
        isEmailVerified: true,
        isGoogleVerified: ref
                .read(authManagerProvider)
                .currentUserModel
                ?.verifyStatus
                ?.isGoogleVerified ??
            false,
        isAppleVerified: ref
                .read(authManagerProvider)
                .currentUserModel
                ?.verifyStatus
                ?.isAppleVerified ??
            false,
      );
      await documentReference.update({
        'verify_status': {
          'is_apple_verified': ref
                  .read(authManagerProvider)
                  .currentUserModel
                  ?.verifyStatus
                  ?.isAppleVerified ??
              false,
          'is_email_verified': true,
          'is_google_verified': ref
                  .read(authManagerProvider)
                  .currentUserModel
                  ?.verifyStatus
                  ?.isGoogleVerified ??
              false,
        },
      });
      ref.read(authManagerProvider).setCurrentUserModel(
          currentUser?.copyWith(verifyStatus: verifyStatus));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> creatUserWithEmailAndPassword(
      {required String mail, required String password}) async {
    try {
      final userCredential = _firebaseAuth.createUserWithEmailAndPassword(
          email: mail, password: password);
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserData(String userId, Map<String, dynamic> body,
      {bool isPhoto = false}) async {
    try {
      // PublicUser? currentUser = await getCurrentUser(userId);
      // currentUser = currentUser!.copyWith(profilePicture: body["profile_picture"]);
      if (isPhoto) {
        await _usersRef.doc(userId).update(body);
      } else {
        await _usersRef.doc(userId).update(body);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream listenUserChanges(String id) {
    return _usersRef.doc(id).snapshots();
  }

  @override
  Future<void> deleteAccount() async {
    await _firebaseAuth.currentUser?.delete();
  }
}

final registrationServicesProvider =
    Provider((ref) => RegistrationServices(ref));
