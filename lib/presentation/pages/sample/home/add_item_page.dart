//add item page

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:angya/extensions/context_extension.dart';
import 'package:angya/gen/assets.gen.dart';
import 'package:angya/model/entities/sample/item/item.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_key.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_repository.dart';
import 'package:angya/model/use_cases/image_compress.dart';
import 'package:angya/model/use_cases/sample/item_controller.dart';
import 'package:angya/presentation/pages/image_viewer/image_viewer.dart';
import 'package:angya/presentation/widgets/color_circle.dart';
import 'package:angya/presentation/widgets/rounded_button.dart';
import 'package:angya/presentation/widgets/sheets/show_photo_and_crop_bottom_sheet.dart';
import 'package:angya/presentation/widgets/thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final titleTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final categoryTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final addressTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class AddItemPage extends HookConsumerWidget {
  const AddItemPage({super.key});


  static Future<void> show(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => const AddItemPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemState = ref.watch(itemProvider);
    final titleTextController = ref.watch(titleTextProvider);
    final categoryTextController = ref.watch(categoryTextProvider);
    final addressTextController = ref.watch(addressTextProvider);


    Item? data;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,

        title: SizedBox(
          height: context.height * 0.1,
          width: context.width * 0.3,
          child: Assets.images.icon.image(),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: context.height * 0.1,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text('タイトル'),
                  ),
                  TextFormField(
                    controller: titleTextController,
                    decoration: const InputDecoration(
                      hintText: 'タイトルを入力してください',
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(),
                      isDense: true,
                      counterText: '',
                    ),
                    validator: (value) => (value == null || value.trim().isEmpty)
                        ? 'タイトルを入力してください'
                        : null,
                    maxLength: 32,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text('カテゴリー'),
                  ),
                  TextFormField(
                    controller: categoryTextController,
                    decoration: const InputDecoration(
                      hintText: 'カテゴリーを入力してください',
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(),
                      isDense: true,
                      counterText: '',
                    ),
                    validator: (value) => (value == null || value.trim().isEmpty)
                        ? 'カテゴリーを入力してください'
                        : null,
                    maxLength: 32,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text('場所'),
                  ),
                  TextFormField(
                    controller: addressTextController,
                    decoration: const InputDecoration(
                      hintText: '場所を入力してください',
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(),
                      isDense: true,
                      counterText: '',
                    ),
                    validator: (value) => (value == null || value.trim().isEmpty)
                        ? '場所を入力してください'
                        : null,
                    maxLength: 32,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: RoundedButton(
                color: Colors.blue,
                elevation: 2,
                onTap: () async {
                  try {
                    final title = titleTextController.text;
                    final category = categoryTextController.text;
                    final address = addressTextController.text;
                    final lat = ref.read(sharedPreferencesRepositoryProvider).fetch<double>(SharedPreferencesKey.lat);
                    final lng = ref.read(sharedPreferencesRepositoryProvider).fetch<double>(SharedPreferencesKey.lng);
                    // await ref.read(itemProvider.notifier)
                    //     .create(title, category,lat!, lng!, address, file);
                    Navigator.pop(context);
                  } on Exception catch (e) {
                    await showOkAlertDialog(context: context, title: '保存できませんでした');
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    '保存する',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
