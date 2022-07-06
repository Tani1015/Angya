import 'package:angya/extensions/context_extension.dart';
import 'package:angya/gen/assets.gen.dart';
import 'package:angya/model/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:angya/model/use_cases/auth/email/sign_in_with_email_and_password.dart';
import 'package:angya/presentation/pages/main/main_page.dart';
import 'package:angya/presentation/pages/signup_page.dart';
import 'package:angya/utils/provider.dart';
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
                  padding: const EdgeInsets.only(top: 80),
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
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: (){
                    final email = emailTextController.text;
                    final pass = passTextController.text;
                    //signIn
                    ref.read(signInWithEmailAndPasswordProvider).call(email, pass);
                    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
                    if(userId != null){
                      print(email);
                      MainPage.show(context);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                  ),
                  child: const Text('ログイン',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('アカウントを持っていない方 ー＞',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 0.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        SignupPage.show(context);
                      },
                      child: const Text('登 録',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          color:  Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
