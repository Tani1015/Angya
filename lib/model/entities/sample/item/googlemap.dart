import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'googlemap.freezed.dart';

@freezed
class GoogleMapState with _$GoogleMapState {
  const factory GoogleMapState({
    LatLng? initialPosition,
    LatLng? lastPosition,
    @Default(true)bool? locationServiceActive,
    @Default(<Marker>{}) Set<Marker>? markers,
    @Default(<Polyline>{}) Set<Polyline>? polyLines,
  }) = _GoogleMapState;
  const GoogleMapState._();
}
