import 'package:final_assignment/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigator_key/navigator_key.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getApplicationTheme(false),
      title: 'Diva Maternity Store',
      home: const Splz.ashView(),
      navigatorKey: AppNavigator.navigatorKey,
    );
  }
}
