// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemList {
  Item get item => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemListCopyWith<ItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemListCopyWith<$Res> {
  factory $ItemListCopyWith(ItemList value, $Res Function(ItemList) then) =
      _$ItemListCopyWithImpl<$Res>;
  $Res call({Item item, int quantity});

  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class _$ItemListCopyWithImpl<$Res> implements $ItemListCopyWith<$Res> {
  _$ItemListCopyWithImpl(this._value, this._then);

  final ItemList _value;
  // ignore: unused_field
  final $Res Function(ItemList) _then;

  @override
  $Res call({
    Object? item = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ItemCopyWith<$Res> get item {
    return $ItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc
abstract class _$$_ItemListCopyWith<$Res> implements $ItemListCopyWith<$Res> {
  factory _$$_ItemListCopyWith(
          _$_ItemList value, $Res Function(_$_ItemList) then) =
      __$$_ItemListCopyWithImpl<$Res>;
  @override
  $Res call({Item item, int quantity});

  @override
  $ItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ItemListCopyWithImpl<$Res> extends _$ItemListCopyWithImpl<$Res>
    implements _$$_ItemListCopyWith<$Res> {
  __$$_ItemListCopyWithImpl(
      _$_ItemList _value, $Res Function(_$_ItemList) _then)
      : super(_value, (v) => _then(v as _$_ItemList));

  @override
  _$_ItemList get _value => super._value as _$_ItemList;

  @override
  $Res call({
    Object? item = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_ItemList(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ItemList extends _ItemList with DiagnosticableTreeMixin {
  _$_ItemList({required this.item, required this.quantity}) : super._();

  @override
  final Item item;
  @override
  final int quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemList(item: $item, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemList'))
      ..add(DiagnosticsProperty('item', item))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemList &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_ItemListCopyWith<_$_ItemList> get copyWith =>
      __$$_ItemListCopyWithImpl<_$_ItemList>(this, _$identity);
}

abstract class _ItemList extends ItemList {
  factory _ItemList({required final Item item, required final int quantity}) =
      _$_ItemList;
  _ItemList._() : super._();

  @override
  Item get item => throw _privateConstructorUsedError;
  @override
  int get quantity => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ItemListCopyWith<_$_ItemList> get copyWith =>
      throw _privateConstructorUsedError;
}
