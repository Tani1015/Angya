import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  //CloudStorage, RealtimeDatabase access permission
  Future<String?> get idToken async{
    return _auth.currentUser?.getIdToken(true);
  }

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) => _auth.createUserWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> signInwithEmailAndPassword(
    String email,
    String password,
  ) => _auth.signInWithEmailAndPassword(email: email, password: password);

  //response email
  Future<void> sendEmailVerification(User user) => user.sendEmailVerification();

  Future<void> signOut() => _auth.signOut();

}