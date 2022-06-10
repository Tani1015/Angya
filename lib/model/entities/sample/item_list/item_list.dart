import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:angya/model/entities/sample/item/item.dart';

part 'item_list.freezed.dart';

@freezed
class ItemList with _$ItemList {
  factory ItemList({
    required Item item,
    required int quantity,
  }) = _ItemList;

  ItemList._();

  // ignore: prefer_constructors_over_static_methods
  static ItemList fromJson(Map<String, dynamic>json) => ItemList(
    item: Item.fromJson(json),
    quantity: json['quantity'] as int,
  );
}