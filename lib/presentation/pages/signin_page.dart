import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final passTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class SigninPage extends HookConsumerWidget{
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailTextController = ref.watch(emailTextProvider);
    final passTextController = ref.watch(passTextProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

      ),
    );
  }

}