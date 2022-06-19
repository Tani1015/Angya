import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

import 'login_type.dart';
import 'package:angya/model/repositories/firebase_auth/auth_provider_id.dart';

final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>((_){
  return FirebaseAuthRepository(FirebaseAuth.instance);
});

class FirebaseAuthRepository {
  FirebaseAuthRepository(this._auth);

  final FirebaseAuth _auth;

  User? get authUser => _auth.currentUser;

  //User id
  String? get loggedInUserId => _auth.currentUser?.uid;

  //response email bool
  // bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  //CloudStorage, RealtimeDatabase access permission
  Future<String?> get idToken async{
    return _auth.currentUser?.getIdToken(true);
  }

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) => _auth.createUserWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) => _auth.signInWithEmailAndPassword(email: email, password: password);

  //response email
  // Future<void> sendEmailVerification(User user) => user.sendEmailVerification();

  Future<void> signOut() => _auth.signOut();

  LoginType? get loginType {
    final user = _auth.currentUser;
    return user != null ? _loginType(user) : null;
  }

  LoginType? _loginType(User user){
    if (user.providerData.firstWhereOrNull(
          (element) => element.providerId == AuthProviderId.email.value,
    ) != null) {
      return LoginType.email;
    }
    return null;
  }

}