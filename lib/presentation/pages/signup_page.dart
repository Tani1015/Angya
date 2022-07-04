import 'package:angya/extensions/context_extension.dart';
import 'package:angya/gen/assets.gen.dart';
import 'package:angya/model/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_key.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_repository.dart';
import 'package:angya/model/use_cases/auth/email/create_user_with_email_and_password.dart';
import 'package:angya/model/use_cases/sample/my_profile.dart';
import 'package:angya/presentation/pages/signin_page.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final nameTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final emailTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final passTextProvider = Provider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class SignupPage extends HookConsumerWidget{
  const SignupPage({super.key});

  static Future<void> show(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => const SignupPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameTextController = ref.watch(nameTextProvider);
    final emailTextController = ref.watch(emailTextProvider);
    final passTextController = ref.watch(passTextProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              Center(
                child:Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: context.height * 0.2,
                        width: context.width * 0.3,
                        child: Assets.images.icon.image(),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color:  Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [

                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: nameTextController,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            hintText: '名前',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: emailTextController,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Eメール',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: passTextController,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'パスワード',
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: () {
                    final localdb = ref.read(sharedPreferencesRepositoryProvider);
                    final createUser = ref.read(createUserWithEmailAndPasswordProvider);
                    final email = emailTextController.text;
                    final pass = passTextController.text;
                    final name = nameTextController.text;

                    //firestore save profile
                    createUser.call(email, pass).whenComplete(() {
                      ref.read(saveMyProfileProvider).call(name: name);
                    });

                    //sharedpreferences save
                    localdb..save<String>(SharedPreferencesKey.email, email)
                      ..save<String>(SharedPreferencesKey.password, pass);

                    final user = ref.read(firebaseAuthRepositoryProvider).authUser;
                    if(user != null){
                      SigninPage.show(context);
                    }

                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                  ),
                  child: const Text('登録',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
