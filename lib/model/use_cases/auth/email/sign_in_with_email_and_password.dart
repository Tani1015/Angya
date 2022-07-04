import 'package:angya/model/repositories/firebase_auth/firebase_auth_repository.dart';
//クラスインポート
import 'package:angya/utils/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signInWithEmailAndPasswordProvider = Provider((ref) => SignInWithEmailAndPassword(ref.read));

class SignInWithEmailAndPassword {
  SignInWithEmailAndPassword(this._read);

  final Reader _read;

  Future call(String email,String password) async{
    final repository = _read(firebaseAuthRepositoryProvider);
    final authState = _read(authStateProvider.state);

    await repository.signInWithEmailAndPassword(email, password);

    final user = _read(firebaseAuthRepositoryProvider).authUser;
    if(user != null) {
      authState.update((state) => AuthState.signIn);
    }else {
      authState.update((state) => AuthState.noSignIn);
    }
  }
}