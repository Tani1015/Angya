// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String? get itemId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  StorageFile? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String? itemId,
      String? title,
      String? address,
      double? lat,
      double? lng,
      String? category,
      StorageFile? imageUrl});

  $StorageFileCopyWith<$Res>? get imageUrl;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? itemId = freezed,
    Object? title = freezed,
    Object? address = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? category = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as StorageFile?,
    ));
  }

  @override
  $StorageFileCopyWith<$Res>? get imageUrl {
    if (_value.imageUrl == null) {
      return null;
    }

    return $StorageFileCopyWith<$Res>(_value.imageUrl!, (value) {
      return _then(_value.copyWith(imageUrl: value));
    });
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? itemId,
      String? title,
      String? address,
      double? lat,
      double? lng,
      String? category,
      StorageFile? imageUrl});

  @override
  $StorageFileCopyWith<$Res>? get imageUrl;
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, (v) => _then(v as _$_Item));

  @override
  _$_Item get _value => super._value as _$_Item;

  @override
  $Res call({
    Object? itemId = freezed,
    Object? title = freezed,
    Object? address = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? category = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_Item(
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as StorageFile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item extends _Item with DiagnosticableTreeMixin {
  const _$_Item(
      {this.itemId,
      this.title,
      this.address,
      this.lat,
      this.lng,
      this.category,
      this.imageUrl})
      : super._();

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String? itemId;
  @override
  final String? title;
  @override
  final String? address;
  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final String? category;
  @override
  final StorageFile? imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Item(itemId: $itemId, title: $title, address: $address, lat: $lat, lng: $lng, category: $category, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Item'))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lng', lng))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            const DeepCollectionEquality().equals(other.itemId, itemId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(itemId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(lng),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(this);
  }
}

abstract class _Item extends Item {
  const factory _Item(
      {final String? itemId,
      final String? title,
      final String? address,
      final double? lat,
      final double? lng,
      final String? category,
      final StorageFile? imageUrl}) = _$_Item;
  const _Item._() : super._();

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String? get itemId => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  double? get lat => throw _privateConstructorUsedError;
  @override
  double? get lng => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  StorageFile? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
