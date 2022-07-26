import 'package:angya/model/entities/storage_file/storage_file.dart';
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
          decode: query.decode,
      );
    }
);

@freezed
class Item with _$Item {
  const factory Item({
    String? itemId,
    String? title,
    String? address,
    double? lat,
    double? lng,
    String? category,
    StorageFile? imageUrl,
  }) = _Item;
  const Item._();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  //pathの指定, fetch　collection
  static String collectionPath(String userId) =>
      'angya/v1/users/$userId/items';
  static CollectionReference<SnapType> colRef(String userId) =>
      Document.colRef(collectionPath(userId));

  static String docPath(String userId,String id) =>
      '${collectionPath(userId)}/$id';

  static DocumentReference<SnapType> docRef(String userId, String id) =>
      Document.docRefWithDocPath(docPath(userId, id));

  static String imagePath(
      String userId,
      String id,
      String filename,
  ) =>  '${docPath(userId,id)}/image/$filename';

  Map<String, dynamic> get toCreateDoc => <String, dynamic>{
    'itemId': itemId,
    'title' : title,
    'address': address,
    'lat' : lat,
    'lng' : lng,
    'category' : category,
    'imageUrl' : imageUrl?.toJson(),
  };

}
