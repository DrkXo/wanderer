import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/router/router.dart';

import 'theme/theme_config.dart';

class Wanderer extends ConsumerWidget {
  const Wanderer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeConfig = ref.watch(themeConfigProvider);

    return MaterialApp.router(
      title: 'Wanderer',
      restorationScopeId: 'wanderer',
      theme: themeConfig.userThemeData(),
      themeMode: themeConfig.userThemeMode(),
      routerConfig: router,
    );
  }
}
