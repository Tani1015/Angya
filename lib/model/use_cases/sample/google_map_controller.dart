import 'dart:async';

import 'package:angya/model/entities/sample/item/googlemap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final googleMapStateProvider = StateNotifierProvider<GoogleMapStateProvider, GoogleMapState>(
        (ref) => GoogleMapStateProvider(),
);

class GoogleMapStateProvider extends StateNotifier<GoogleMapState> {
  GoogleMapStateProvider() : super(const GoogleMapState());

  Completer<GoogleMapController>? googleMapController;
  final Set<Marker> _markers = {};

  Future<void> initState() async {
    googleMapController = Completer();
    await _setInitialLocation();
    state = state.copyWith(lastPosition: state.initialPosition);
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController!.complete(controller);
  }

  void onCameraMove(CameraPosition position) {
    state = state.copyWith(lastPosition: position.target);
  }

  void _addMarker(LatLng location) {
    _markers.add(Marker(
        markerId: MarkerId(state.lastPosition.toString()),
        position: location,),
    );
    state = state.copyWith(markers: _markers);
  }



  Future _getUserLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true,
      );
      state = state.copyWith(
          lastPosition: LatLng(position.latitude, position.longitude),);
    } catch (e) {
      throw ('現在地を取得できません');
    }
  }

  Future<void> _setInitialLocation() async {

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('ロケーション設定を有効にしてください');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('ロケーション設定を有効にしてください');
      }
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    state = state.copyWith(
      initialPosition: LatLng(position.latitude, position.longitude),
    );
  }
}
