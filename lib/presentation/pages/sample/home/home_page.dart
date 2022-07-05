import 'package:angya/model/use_cases/sample/google_map_controller.dart';
import 'package:angya/presentation/custom_hooks/use_effect_once.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final searchTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final searchTextController = ref.watch(searchTextProvider);
    final mapController= ref.watch(googleMapStateProvider.notifier);
    final mapState = ref.watch(googleMapStateProvider);
    final touchFlag = useState<bool>(false);


    useEffectOnce(() {
      Future(() async{
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
              color:  Colors.white.withOpacity(0.9),
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
            zoomControlsEnabled: false,
            onMapCreated: mapController.onMapCreated,
            onTap: (latLng) {

            },
          ),

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
