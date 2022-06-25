import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angya/utils/provider.dart';
import 'package:angya/utils/uuid_generator.dart';
import 'package:angya/model/entities/sample/user/user.dart';
import 'package:angya/model/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:angya/model/repositories/firestore/document_repository.dart';
import 'package:angya/model/repositories/firebase_storage/firebase_storage_repository.dart';
import 'package:angya/model/repositories/firebase_storage/mime_type.dart';
import 'package:angya/model/entities/storage_file/storage_file.dart';

final saveMyProfileProvider = Provider((ref) => SaveMyProfile(ref.read));
final saveMyProfileImageProvider = Provider((ref) => SaveMyProfileImage(ref.read));
final fetchMyProfileProvider = StreamProvider<User?>((ref) {

  final authState = ref.watch(authStateProvider);
  if(authState == AuthState.noSignIn) {
    return Stream.value(null);
  }

  final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
  if(userId == null){
    return Stream.value(null);
  }
  //get document(userId) = User
  return ref.read(documentRepositoryProvider)
      .snapshots(User.docPath(userId))
      .map((event) {
        final data = event.data();
        return data != null ? User.fromJson(data) : null;
  });
});

class SaveMyProfile {
  SaveMyProfile(this._read);
  final Reader _read;

  Future call({String? name,}) async{
    final userId = _read(firebaseAuthRepositoryProvider).loggedInUserId;
    final profile = _read(fetchMyProfileProvider).value;
    final newProfile = (profile ?? User(userId: userId!)).copyWith(name: name,);
    await _read(documentRepositoryProvider).save(
        User.docPath(userId!), data: newProfile.toDocWithNotImage,
    );
  }
}

class SaveMyProfileImage {
  SaveMyProfileImage(this._read);

  final Reader _read;

  Future call(Uint8List file) async{
    //uid
    final userId = _read(firebaseAuthRepositoryProvider).loggedInUserId;
   //random id
    final filename = UuidGenerator.create();
    final imagePath = User.imagePath(userId!, filename);
    const mimeType = MimeType.applicationOctetStream;
    final imageUrl = await _read(firebaseStorageRepositoryProvider).save(
      file,
      path: imagePath,
      mimeType: mimeType,
    );

    //get profile data
    final profile = _read(fetchMyProfileProvider).value;
    final newProfile = (profile ?? User(userId:  userId).copyWith(
        image: StorageFile(
          url: imageUrl,
          path: imagePath,
          mimeType: mimeType.value
        )
      )
    );

    //save newProfile
    await _read(documentRepositoryProvider).save(
      User.docPath(userId),
      data: newProfile.toImageOnly
    );

    //delete image path
    final oldImage = profile?.image;
    if(oldImage != null){
      await _read(firebaseStorageRepositoryProvider).delete(oldImage.path);
    }
  }
}
