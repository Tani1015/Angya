import 'package:angya/model/repositories/firestore/collection_paging_repository.dart';
import 'package:angya/model/repositories/firestore/document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'item.freezed.dart';
part 'item.g.dart';

final itemPagingProvider = Provider.family
    .autoDispose<CollectionPagingRepository<Item>, CollectionParam<Item>>(
    (ref, query) {
      return CollectionPagingRepository<Item>(
          query: query.query,
          decode: query.decode
      );
    }
);

@freezed
class Item with _$Item {
  factory Item({
    required String id,
    required String title,
    required String address,
    required double lat,
    required double lng,
    required String category,
    required String imageUrl,
  }) = _Item;
  Item._();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  //pathの指定, fetch　collection
  static String collectionPath(String userId) =>
      'angya/v1/users/$userId/items';
  static CollectionReference<SnapType> colRef(String userId) =>
      Document.colRef(collectionPath(userId));

  static String docPath(String userId,String id) =>
      '${collectionPath(userId)}/$id';
  static DocumentReference<SnapType> decRef(String userId, String id)=>
      Document.docRefWithDocPath(docPath(userId, id));


}