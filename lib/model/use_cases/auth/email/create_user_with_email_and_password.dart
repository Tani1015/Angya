import 'package:hooks_riverpod/hooks_riverpod.dart';

//クラスインポート
import 'package:angya/utils/provider.dart';
import 'package:angya/model/repositories/firebase_auth/firebase_auth_repository.dart';

final createUserWithEmailAndPasswordProvider =
    Provider((ref) => CreateUserWithEmailAndPassword(ref.read));

class CreateUserWithEmailAndPassword {
  CreateUserWithEmailAndPassword(this._read);

  final Reader _read;

  Future call(String email, String password) async{
    final repository = _read(firebaseAuthRepositoryProvider);
    final authState = _read(authStateProvider.state);

    await repository.createUserWithEmailAndPassword(email, password);
    authState.update((state) => AuthState.noSignIn);
  }
}