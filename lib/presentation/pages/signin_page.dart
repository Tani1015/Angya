import 'package:flutter/material.dart';
import 'package:angya/gen/assets.gen.dart';
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
    final emailTextController = ref.watch(emailTextProvider);
    final passTextController = ref.watch(passTextProvider);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.icon.image(),
              const Text("あんぎゃ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),

          Center(
            child: SizedBox(
              height: 100,
              width: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: emailTextController,
                      decoration: InputDecoration(
                        hintText: 'Eメールを入力してください',
                        hintStyle: const TextStyle(fontSize: 12,color: Colors.black),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.0
                          )
                        )
                      ),
                    ),
                    TextFormField(
                      controller: passTextController,
                      decoration: InputDecoration(
                          hintText: 'パスワードを入力してください',
                          hintStyle: const TextStyle(fontSize: 12,color: Colors.black),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 1.0
                              )
                          )
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 50,
            width: 50,
            child: // Flutter1.22以降のみ
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: const StadiumBorder(),
                side: const BorderSide(color: Colors.green),
              ),
              onPressed: () {},
              child: const Text('サインイン'),
            ),
          ),

        ],
      ),
    );
  }

}