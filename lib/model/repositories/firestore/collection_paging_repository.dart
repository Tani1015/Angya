import 'document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angya/model/entities/sample/item/item.dart';

class CollectionParam<T extends Object>{
  CollectionParam({
    required this.query,
    required this.decode
  });
  final Query<Map<String,dynamic>> query;
  final T Function(Map<String, dynamic>) decode;
}

class CollectionPagingRepository<T extends Object> {
  CollectionPagingRepository({
    required this.query,
    required this.decode
  });
  final Query<Map<String, dynamic>> query;
  final T Function(Map<String, dynamic>) decode;

  Future<List<Document<T>>> fetch({
    //server -> cash (device offline not chache)
    Source source = Source.serverAndCache,
    void Function(List<Document<T>>)? fromCache
  }) async {
    if(fromCache != null){
      final cacheDocuments = await _fetch(source: Source.cache);
      fromCache(
        cacheDocuments.map(
            (e) => Document(
              //DocumentSnapshot
              ref:  e.reference,
              //True or False
              exists: e.exists,
              //Get Map<String,dynamic> data() (exists == true)
              entity: e.exists ? decode(e.data()!) : null,
            ),
        ).toList(),
      );
    }

    final documents = await _fetch(source: source);
    return documents.map(
            (e) => Document(
              ref:  e.reference,
              exists: e.exists,
              entity: e.exists ? decode(e.data()!) : null,
            ),
          ).toList();
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> _fetch({
    Source source = Source.serverAndCache,
  }) async {
    var dataSource = query;
    // always get server data
    final result = await dataSource.get(GetOptions(source: source));
    final documents = result.docs.toList();
    return documents;
  }
}