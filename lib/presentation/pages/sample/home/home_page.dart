import 'package:angya/model/repositories/shared_preferences/shared_preference_key.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_repository.dart';
import 'package:angya/model/use_cases/sample/google_map_controller.dart';
import 'package:angya/model/use_cases/sample/search_item_controller.dart';
import 'package:angya/presentation/custom_hooks/use_effect_once.dart';
import 'package:angya/presentation/pages/sample/home/add_item_page.dart';
import 'package:angya/presentation/pages/sample/home/search_items_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = ref.watch(searchTextEditingController);
    final mapController = ref.watch(googleMapStateProvider.notifier);
    final mapState = ref.watch(googleMapStateProvider);
    final touchFlag = useState<bool>(false);

    useEffectOnce(() {
      Future(() async {
        await mapController.initState();
      });
      return null;
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        title: Padding(
          padding: const EdgeInsets.all(5),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.7),
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
                  if (searchTextController.text != '') {
                    ref
                        .watch(searchItemProvider.notifier)
                        .fetch(searchTextController.text);
                    SearchItemPage.show(context);
                  }
                },
              ),
            ),
          ),
        ),
      ),
      body: mapState.initialPosition == null
          ? const SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: mapState.initialPosition!,
                zoom: 15,
              ),
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: mapController.onMapCreated,
              onTap: (latLng) {
                touchFlag.value == true
                    ? AddItemPage.show(context).whenComplete(() {
                        touchFlag.value = false;
                        ref.read(sharedPreferencesRepositoryProvider)
                          ..save<double>(
                              SharedPreferencesKey.lat, latLng.latitude)
                          ..save<double>(
                              SharedPreferencesKey.lng, latLng.longitude);
                      })
                    : null;
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: touchFlag.value == false
            ? Colors.blue.shade200
            : Colors.red.shade200,
        child: const Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        onPressed: () {
          touchFlag.value = !touchFlag.value;
        },
      ),
    );
  }
}
