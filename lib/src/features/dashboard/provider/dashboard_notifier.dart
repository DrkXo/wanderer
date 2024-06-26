import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/repo/media_item_repo.dart';

part 'dashboard_notifier.g.dart';

@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  final TextEditingController _searchController = TextEditingController();

  void onTapNavigationItem(StatefulNavigationShell navigationShell, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
    if (index == 0) {
      ref.invalidate(mediaItemHistoryProvider);
    }
  }

  TextEditingController getSearchController() => _searchController;

  @override
  DashboardNotifier build() {
    ref.onDispose(() {
      _searchController.dispose();
    });
    return this;
  }
}
