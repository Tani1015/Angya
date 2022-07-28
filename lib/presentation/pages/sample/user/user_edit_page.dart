import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:angya/extensions/context_extension.dart';
import 'package:angya/gen/assets.gen.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_key.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_repository.dart';
import 'package:angya/model/use_cases/auth/sign_out.dart';
import 'package:angya/model/use_cases/image_compress.dart';
import 'package:angya/model/use_cases/sample/my_profile.dart';
import 'package:angya/presentation/custom_hooks/use_effect_once.dart';
import 'package:angya/presentation/custom_hooks/use_form_field_state_key.dart';
import 'package:angya/presentation/pages/image_viewer/image_viewer.dart';
import 'package:angya/presentation/pages/sample/user/user_page.dart';
import 'package:angya/presentation/pages/signin_page.dart';
import 'package:angya/presentation/pages/start_up_page.dart';
import 'package:angya/presentation/widgets/color_circle.dart';
import 'package:angya/presentation/widgets/rounded_button.dart';
import 'package:angya/presentation/widgets/sheets/show_photo_and_crop_bottom_sheet.dart';
import 'package:angya/presentation/widgets/show_indicator.dart';
import 'package:angya/presentation/widgets/thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserEditPage extends HookConsumerWidget {
  const UserEditPage({super.key});

  static Future<void> show(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => const UserEditPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(fetchMyProfileProvider).value;
    final nameFormKey = useFormFieldStateKey();

    useEffectOnce(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        nameFormKey.currentState?.didChange(profile?.name);
      });
      return null;
    });

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
      body: Column(
        children: [
          SizedBox(height: context.height * 0.1),
          Stack(
            children: [
              CircleThumbnail(
                size: 96,
                url: profile?.image?.url,
                onTap: () {
                  final url = profile?.image?.url;
                  if (url != null) {
                    ImageViewer.show(context, urls: [url]);
                  }
                },
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: ColorCircleIcon(
                  onTap: () async {
                    final selectedImage = await showPhotoAndCropBottomSheet(
                      context,
                      title: 'プロフィール画像',
                    );
                    if (selectedImage == null) {
                      return;
                    }

                    final compressImage =
                        await ref.read(imageCompressProvider)(selectedImage);
                    if (compressImage == null) {
                      return;
                    }

                    try {
                      await ref
                          .read(saveMyProfileImageProvider)
                          .call(compressImage);
                    } on Exception catch (e) {
                      await showOkAlertDialog(
                        context: context,
                        title: '画像を保存できませんでした',
                      );
                    }
                  },
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
            ],
          ),

          // 入力フォーム
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text('名前'),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '名前を入力してください',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    border: OutlineInputBorder(),
                    isDense: true,
                    counterText: '',
                  ),
                  key: nameFormKey,
                  initialValue: profile?.name,
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? '名前を入力してください'
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
                if (!nameFormKey.currentState!.validate()) {
                  return;
                }
                final name = nameFormKey.currentState?.value?.trim() ?? '';
                try {
                  await ref.read(saveMyProfileProvider).call(
                        name: name,
                      );
                  Navigator.pop(context);
                } on Exception catch (e) {
                  await showOkAlertDialog(
                      context: context, title: '保存できませんでした');
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

          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: RoundedButton(
              color: Colors.red,
              onTap: () {
                ref.read(sharedPreferencesRepositoryProvider)
                  ..remove(SharedPreferencesKey.email)
                  ..remove(SharedPreferencesKey.password);
                ref.read(signOutProvider)();
                StartUpPage.show(context);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  'ログアウト',
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
    );
  }
}
