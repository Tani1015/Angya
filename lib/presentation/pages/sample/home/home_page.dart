import 'dart:async';

import 'package:angya/extensions/context_extension.dart';
import 'package:angya/gen/assets.gen.dart';
import 'package:angya/model/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_key.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_repository.dart';
import 'package:angya/utils/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final searchTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  //
  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414,
  // );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = Completer<GoogleMapController>();
    final searchTextController = ref.watch(searchTextProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        title: Padding(
          padding: const EdgeInsets.all(5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color:  Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                controller: searchTextController,
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: '検索',
                ),
                onSubmitted: (_) {
                  if(searchTextController.text != ''){
                    print(searchTextController.text);
                  }
                },
              ),
            ),
          ),
        ),
      ),
      // body: GoogleMap(
      //   initialCameraPosition: _kGooglePlex,
      //   onMapCreated: mapController.complete,
      //   onTap: (latLng) {
      //     print('${latLng.latitude}, ${latLng.longitude}');
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade200,
        child: const Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        onPressed: () {
        },
      ),
    );
  }
}
