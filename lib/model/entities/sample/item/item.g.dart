// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      itemId: json['itemId'] as String?,
      title: json['title'] as String?,
      address: json['address'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      category: json['category'] as String?,
      imageUrl: json['imageUrl'] == null
          ? null
          : StorageFile.fromJson(json['imageUrl'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'title': instance.title,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
    };
