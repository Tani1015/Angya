import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:angya/utils/provider.dart';
import 'res/theme.dart';
import 'package:angya/presentation/pages/start_up_page.dart';

class App extends ConsumerWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return MaterialApp(
      title: 'Angya',
      //MediaQueryの継承 devise height and width
      useInheritedMediaQuery: true,
      //テーマ
      //ダークテーマ
      navigatorKey: ref.watch(navigatorKeyProvider),
      debugShowCheckedModeBanner: false,
      supportedLocales: const[
        Locale('ja', 'JP')
      ],
      home: const StartUpPage(),
    );
  }
}