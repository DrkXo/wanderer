import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/router/router.dart';

class Wanderer extends ConsumerWidget {
  const Wanderer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Wanderer',
      routerConfig: router,
    );
  }
}
