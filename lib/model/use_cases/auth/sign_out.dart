import 'package:hooks_riverpod/hooks_riverpod.dart';

//クラスインポート
import 'package:angya/utils/provider.dart';
import 'package:angya/model/repositories/firebase_auth/firebase_auth_repository.dart';

final signOutProvider = Provider((ref) => SignOut(ref.read));

class SignOut{
  SignOut(this._read);
  final Reader _read;

  Future call() async{
    //サインイン状態確認
    _read(authStateProvider.state).update((state) => AuthState.noSignIn);
    await _read(firebaseAuthRepositoryProvider).signOut();
  }
}