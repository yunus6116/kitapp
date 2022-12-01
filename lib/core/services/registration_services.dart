import 'package:kitapp/core/global_models/public_user/verify_status_model.dart';
import '../../view/pages/sign_up_page/viewmodel/sign_up_viewmodel.dart';
import '../enums/collection_name.dart';
import '../global_models/public_user/public_user_model.dart';
import '../init/auth_manager/auth_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../global_providers/global_providers.dart';

abstract class IRegistrationServices {
  Future<UserCredential> signInWithMail(String mail, String password);

  Future<UserCredential> creatUserWithEmailAndPassword(
      {required String name,
      required String lastName,
      required String mail,
      required String password});

  Future<void> createUserIntoFireStore({required User user});

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

  @override
  Future<void> createUserIntoFireStore({
    required User? user,
  }) async {
    try {
      PublicUser? publicUser = ref.read(signUpVMProvider).publicUser;
      DocumentReference documentReference = _fireStore
          .collection(CollectionName.users.collectionName)
          .doc(user!.uid);
      PublicUser publicUserToFireStore =
          PublicUser.fromUserCredential(user, publicUser);
      ref.read(authManagerProvider).setCurrentOnlineUser(user);
      ref.read(authManagerProvider).setCurrentUserModel(publicUserToFireStore);
      await documentReference.set(publicUserToFireStore.toMap());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    User? currentFirebaseUser = _firebaseAuth.currentUser;
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
        return PublicUser.fromMap(data);
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
      );
      await documentReference.update({
        'verify_status': {
          'is_email_verified': true,
        },
      });
      ref.read(authManagerProvider).setCurrentUserModel(
          currentUser?.copyWith(verifyStatus: verifyStatus));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> creatUserWithEmailAndPassword({
    required String name,
    required String lastName,
    required String mail,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: mail, password: password);
      await createUserIntoFireStore(user: userCredential.user);
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
