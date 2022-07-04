//search_item_controller
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angya/exceptions/app_exception.dart';
import 'package:angya/extensions/exception_extension.dart';
import 'package:angya/results/result_void_data.dart';
import 'package:angya/utils/provider.dart';
import 'package:angya/model/entities/sample/item/item.dart';
import 'package:angya/model/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:angya/model/repositories/firestore/collection_paging_repository.dart';
import 'package:angya/model/repositories/firestore/document.dart';

final searchTextEditingController = StateProvider((ref){
  return TextEditingController(text: '');
});

final searchItemProvider = StateNotifierProvider<SearchItemController,List<Item>>((ref){
  ref.watch(authStateProvider);
  ref.watch(searchTextEditingController);
  return SearchItemController(ref.read);
});

class SearchItemController extends StateNotifier<List<Item>> {
  SearchItemController(this._read,) : super([]) {
    final userId = _firebaseAuthRepository.loggedInUserId;
    if (userId == null) {
      return;
    }
    final searchText =  _searchText.text;
    _collectionPagingRepository = _read(
        itemPagingProvider(
            CollectionParam<Item>(
                query: Document.colRef(
                  Item.collectionPath(userId),
                ).where('category', arrayContains: searchText),
                decode: Item.fromJson
            )
        )
    );
  }

  final Reader _read;

  FirebaseAuthRepository get _firebaseAuthRepository =>
      _read(firebaseAuthRepositoryProvider);

  // DocumentRepository get _documentRepository =>
  //     _read(documentRepositoryProvider);

  CollectionPagingRepository<Item>? _collectionPagingRepository;

  // FirebaseStorageRepository get _firebaseStorageRepository =>
  //     _read(firebaseStorageRepositoryProvider);

  TextEditingController get _searchText =>
      _read(searchTextEditingController);

  Future<ResultVoidData> fetch() async {
    try {
      final repository = _collectionPagingRepository;
      if (repository == null) {
        throw AppException.irregular();
      }
      //entityをステートに入れる
      final data = await repository.fetch(
          fromCache: (cache) {
            state = cache.map((e) => e.entity).whereType<Item>().toList();
          }
      );
      state = data.map((e) => e.entity).whereType<Item>().toList();
      return const ResultVoidData.success();
      //エラー処理
    } on AppException catch (e) {
      return ResultVoidData.failure(e);
      //エラー表示
    } on Exception catch (e) {
      return ResultVoidData.failure(AppException.error(e.errorMessage));
    }
  }
}