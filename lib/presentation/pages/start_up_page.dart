import 'dart:async';

import 'package:angya/model/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_key.dart';
import 'package:angya/model/repositories/shared_preferences/shared_preference_repository.dart';
import 'package:angya/model/use_cases/auth/email/sign_in_with_email_and_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import 'package:angya/presentation/pages/main/main_page.dart';
import 'package:angya/presentation/custom_hooks/use_effect_once.dart';
import 'package:angya/utils/provider.dart';

import 'package:angya/presentation/pages/signin_page.dart';

class StartUpPage extends HookConsumerWidget {

  const StartUpPage({super.key});

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context,rootNavigator: true)
        .pushReplacement<MaterialPageRoute<dynamic>, void>(
      PageTransition(
          child: const StartUpPage(),
          type:  PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
      ),
    );
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffectOnce((){
      Future(() async {
        //shared preferencesでメールとパスワードの認証をしてログインする
        final localdb = ref.read(sharedPreferencesRepositoryProvider);
        //　※emailとpasswordは暗号化していない
        final localEmail = localdb.fetch(SharedPreferencesKey.email);
        final localPass = localdb.fetch(SharedPreferencesKey.password);
        if(localEmail != null && localPass != null){
          ref.read(signInWithEmailAndPasswordProvider).call(localEmail, localPass);
        }
        //loginTypeの確認 null or email
        final loginType = ref.read(firebaseAuthRepositoryProvider).loginType;
        if(loginType != null){
          unawaited(MainPage.show(context));
        }else {
          unawaited(SigninPage.show(context));
        }
      });
      return null;
    });
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}