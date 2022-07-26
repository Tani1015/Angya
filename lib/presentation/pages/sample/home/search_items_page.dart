import 'package:angya/extensions/context_extension.dart';
import 'package:angya/model/use_cases/sample/google_map_controller.dart';
import 'package:angya/model/use_cases/sample/search_item_controller.dart';
import 'package:angya/presentation/custom_hooks/use_effect_once.dart';
import 'package:angya/presentation/widgets/thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchItemPage extends HookConsumerWidget {
  const SearchItemPage({super.key});

  static Future<void> show(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => const SearchItemPage(),
      ),
    );
  }

  static Future<void> ReplaceShow(BuildContext context) {
    return Navigator.of(context).pushReplacement<void, void>(
      MaterialPageRoute(
        builder: (_) => const SearchItemPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = ref.watch(searchTextEditingController);
    final mapController = ref.watch(googleMapStateProvider.notifier);
    final mapState = ref.watch(googleMapStateProvider);
    final items = ref.watch(searchItemProvider);
    final scrollController = useScrollController();

    useEffectOnce(() {
      Future(() async {
        await mapController.initState();
        final result = await ref
            .watch(searchItemProvider.notifier)
            .fetch(searchTextController.text);
        result.when(
          success: () {},
          failure: (e) {},
        );
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
                        .read(searchItemProvider.notifier)
                        .fetch(searchTextController.text);
                    SearchItemPage.ReplaceShow(context);
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
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: mapState.initialPosition!,
                    zoom: 15,
                  ),
                  zoomControlsEnabled: false,
                  onMapCreated: mapController.onMapCreated,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: context.height * 0.35,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            color: Colors.grey.shade200,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Thumbnail(
                                    height: context.height * 0.25,
                                    width: context.width,
                                    url: items[index].imageUrl?.url,
                                  ),
                                ),
                                Text(items[index].title!),
                                Text(items[index].address!),
                                Text(items[index].category!)
                              ],
                            ),
                          );
                        },
                        itemCount: items.length,
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }
}
