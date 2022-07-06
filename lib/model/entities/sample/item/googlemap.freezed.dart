// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'googlemap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleMapState {
  LatLng? get initialPosition => throw _privateConstructorUsedError;
  LatLng? get lastPosition => throw _privateConstructorUsedError;
  bool? get locationServiceActive => throw _privateConstructorUsedError;
  Set<Marker>? get markers => throw _privateConstructorUsedError;
  Set<Polyline>? get polyLines => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleMapStateCopyWith<GoogleMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleMapStateCopyWith<$Res> {
  factory $GoogleMapStateCopyWith(
          GoogleMapState value, $Res Function(GoogleMapState) then) =
      _$GoogleMapStateCopyWithImpl<$Res>;
  $Res call(
      {LatLng? initialPosition,
      LatLng? lastPosition,
      bool? locationServiceActive,
      Set<Marker>? markers,
      Set<Polyline>? polyLines});
}

/// @nodoc
class _$GoogleMapStateCopyWithImpl<$Res>
    implements $GoogleMapStateCopyWith<$Res> {
  _$GoogleMapStateCopyWithImpl(this._value, this._then);

  final GoogleMapState _value;
  // ignore: unused_field
  final $Res Function(GoogleMapState) _then;

  @override
  $Res call({
    Object? initialPosition = freezed,
    Object? lastPosition = freezed,
    Object? locationServiceActive = freezed,
    Object? markers = freezed,
    Object? polyLines = freezed,
  }) {
    return _then(_value.copyWith(
      initialPosition: initialPosition == freezed
          ? _value.initialPosition
          : initialPosition // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      lastPosition: lastPosition == freezed
          ? _value.lastPosition
          : lastPosition // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      locationServiceActive: locationServiceActive == freezed
          ? _value.locationServiceActive
          : locationServiceActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      markers: markers == freezed
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>?,
      polyLines: polyLines == freezed
          ? _value.polyLines
          : polyLines // ignore: cast_nullable_to_non_nullable
              as Set<Polyline>?,
    ));
  }
}

/// @nodoc
abstract class _$$_GoogleMapStateCopyWith<$Res>
    implements $GoogleMapStateCopyWith<$Res> {
  factory _$$_GoogleMapStateCopyWith(
          _$_GoogleMapState value, $Res Function(_$_GoogleMapState) then) =
      __$$_GoogleMapStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {LatLng? initialPosition,
      LatLng? lastPosition,
      bool? locationServiceActive,
      Set<Marker>? markers,
      Set<Polyline>? polyLines});
}

/// @nodoc
class __$$_GoogleMapStateCopyWithImpl<$Res>
    extends _$GoogleMapStateCopyWithImpl<$Res>
    implements _$$_GoogleMapStateCopyWith<$Res> {
  __$$_GoogleMapStateCopyWithImpl(
      _$_GoogleMapState _value, $Res Function(_$_GoogleMapState) _then)
      : super(_value, (v) => _then(v as _$_GoogleMapState));

  @override
  _$_GoogleMapState get _value => super._value as _$_GoogleMapState;

  @override
  $Res call({
    Object? initialPosition = freezed,
    Object? lastPosition = freezed,
    Object? locationServiceActive = freezed,
    Object? markers = freezed,
    Object? polyLines = freezed,
  }) {
    return _then(_$_GoogleMapState(
      initialPosition: initialPosition == freezed
          ? _value.initialPosition
          : initialPosition // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      lastPosition: lastPosition == freezed
          ? _value.lastPosition
          : lastPosition // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      locationServiceActive: locationServiceActive == freezed
          ? _value.locationServiceActive
          : locationServiceActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      markers: markers == freezed
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>?,
      polyLines: polyLines == freezed
          ? _value._polyLines
          : polyLines // ignore: cast_nullable_to_non_nullable
              as Set<Polyline>?,
    ));
  }
}

/// @nodoc

class _$_GoogleMapState extends _GoogleMapState {
  const _$_GoogleMapState(
      {this.initialPosition,
      this.lastPosition,
      this.locationServiceActive = true,
      final Set<Marker>? markers = const <Marker>{},
      final Set<Polyline>? polyLines = const <Polyline>{}})
      : _markers = markers,
        _polyLines = polyLines,
        super._();

  @override
  final LatLng? initialPosition;
  @override
  final LatLng? lastPosition;
  @override
  @JsonKey()
  final bool? locationServiceActive;
  final Set<Marker>? _markers;
  @override
  @JsonKey()
  Set<Marker>? get markers {
    final value = _markers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  final Set<Polyline>? _polyLines;
  @override
  @JsonKey()
  Set<Polyline>? get polyLines {
    final value = _polyLines;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  String toString() {
    return 'GoogleMapState(initialPosition: $initialPosition, lastPosition: $lastPosition, locationServiceActive: $locationServiceActive, markers: $markers, polyLines: $polyLines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleMapState &&
            const DeepCollectionEquality()
                .equals(other.initialPosition, initialPosition) &&
            const DeepCollectionEquality()
                .equals(other.lastPosition, lastPosition) &&
            const DeepCollectionEquality()
                .equals(other.locationServiceActive, locationServiceActive) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality()
                .equals(other._polyLines, _polyLines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initialPosition),
      const DeepCollectionEquality().hash(lastPosition),
      const DeepCollectionEquality().hash(locationServiceActive),
      const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_polyLines));

  @JsonKey(ignore: true)
  @override
  _$$_GoogleMapStateCopyWith<_$_GoogleMapState> get copyWith =>
      __$$_GoogleMapStateCopyWithImpl<_$_GoogleMapState>(this, _$identity);
}

abstract class _GoogleMapState extends GoogleMapState {
  const factory _GoogleMapState(
      {final LatLng? initialPosition,
      final LatLng? lastPosition,
      final bool? locationServiceActive,
      final Set<Marker>? markers,
      final Set<Polyline>? polyLines}) = _$_GoogleMapState;
  const _GoogleMapState._() : super._();

  @override
  LatLng? get initialPosition => throw _privateConstructorUsedError;
  @override
  LatLng? get lastPosition => throw _privateConstructorUsedError;
  @override
  bool? get locationServiceActive => throw _privateConstructorUsedError;
  @override
  Set<Marker>? get markers => throw _privateConstructorUsedError;
  @override
  Set<Polyline>? get polyLines => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleMapStateCopyWith<_$_GoogleMapState> get copyWith =>
      throw _privateConstructorUsedError;
}
