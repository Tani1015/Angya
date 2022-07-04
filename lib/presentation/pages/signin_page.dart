import 'package:angya/extensions/context_extension.dart';
import 'package:angya/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final passTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class SigninPage extends HookConsumerWidget{
  const SigninPage({super.key});

  static Future<void> show(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
          builder: (_) => const SigninPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final emailTextController = ref.watch(emailTextProvider);
    // final passTextController = ref.watch(passTextProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child:Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: context.height * 0.2,
                      width: context.width * 0.3,
                      child: Assets.images.icon.image(),
                    ),
                    const Text(
                        'あんぎゃ',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child:
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      )
    );
  }

}