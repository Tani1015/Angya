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
    required double lat,
    required double lng,
    required String category,
    required String imageUrl,
  }) = _Item;
  Item._();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}