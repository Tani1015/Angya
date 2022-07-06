import 'dart:typed_data';

import 'package:angya/exceptions/app_exception.dart';
import 'package:angya/extensions/exception_extension.dart';
import 'package:angya/model/entities/sample/item/item.dart';
import 'package:angya/model/entities/storage_file/storage_file.dart';
import 'package:angya/model/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:angya/model/repositories/firebase_storage/firebase_storage_repository.dart';
import 'package:angya/model/repositories/firebase_storage/mime_type.dart';
import 'package:angya/model/repositories/firestore/document.dart';
import 'package:angya/model/repositories/firestore/document_repository.dart';
import 'package:angya/results/result_void_data.dart';
import 'package:angya/utils/provider.dart';
import 'package:angya/utils/uuid_generator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final saveItemProvider = StateNotifierProvider<SaveItemController, Item>((ref) {
  ref.watch(authStateProvider);
  return SaveItemController(ref.read);
});


class SaveItemController extends StateNotifier<Item>{
  SaveItemController(this._read) : super(const Item());
  final Reader _read;

  FirebaseAuthRepository get _firebaseAuthRepository =>
      _read(firebaseAuthRepositoryProvider);

  DocumentRepository get _documentRepository =>
      _read(documentRepositoryProvider);

  Future<ResultVoidData> create(
      String title,
      String category,
      double lat,
      double lng,
      String address,
      StorageFile file,
  ) async {
    try{
      final userId = _firebaseAuthRepository.loggedInUserId;
      if(userId == null){
        throw AppException(title: 'ログインしてください');
      }
      final ref = Document.docRef(Item.collectionPath(userId));

      //Firestoreへの保存
      final data = Item(
        itemId: ref.id,
        title: title,
        category: category,
        address: address,
        lat: lat,
        lng: lng,
        imageUrl: file,
      );

      await _documentRepository.save(
        Item.docPath(userId, ref.id),
        data: data.toCreateDoc,
      );

      //state変更
      state = data;
      return const ResultVoidData.success();
    }on AppException catch(e) {
      return ResultVoidData.failure(e);
    }on Exception catch (e) {
      return ResultVoidData.failure(AppException.error(e.errorMessage));
    }
  }

  Future<ResultVoidData> saveIamgeOnly(
      Uint8List file,
  ) async {
    try {
      final userId = _firebaseAuthRepository.loggedInUserId;
      if (userId == null) {
        throw AppException(title: 'ログインしてください');
      }
      final ref = Document.docRef(Item.collectionPath(userId));

      //画像の保存(cloud storage)
      final filename = UuidGenerator.create();
      final imagePath = Item.imagePath(userId, ref.id, filename);
      const mimeType = MimeType.applicationOctetStream;
      final imageUrl = await _read(firebaseStorageRepositoryProvider).save(
        file,
        path: imagePath,
        mimeType: mimeType,
      );

      final image = StorageFile(
        url: imageUrl,
        path: imagePath,
        mimeType: mimeType.value,
      );

      state = state.copyWith(
        imageUrl: image,
      );
      return  const ResultVoidData.success();
    }on AppException catch(e) {
      return ResultVoidData.failure(e);
    }on Exception catch (e) {
      return ResultVoidData.failure(AppException.error(e.errorMessage));
    }
  }

  void delete(){
    state = state.copyWith(
      imageUrl: null,
    );
  }
}