import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  factory Item({
    required String id,
    required String title,
    required String address,
    required String imageUrl,
    required double lng,
    required double lat,
    required String category,
  }) = _Item;
  Item._();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

}