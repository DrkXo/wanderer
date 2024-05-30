import 'package:animations/animations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/provider/shared_pref_provider/shared_pref_provider.dart';

part 'theme_config.g.dart';

const PageTransitionsTheme _pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: SharedAxisPageTransitionsBuilder(
      transitionType: SharedAxisTransitionType.scaled,
    ),
    TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
      transitionType: SharedAxisTransitionType.scaled,
    ),
    TargetPlatform.linux: SharedAxisPageTransitionsBuilder(
      transitionType: SharedAxisTransitionType.scaled,
    ),
    TargetPlatform.macOS: SharedAxisPageTransitionsBuilder(
      transitionType: SharedAxisTransitionType.scaled,
    ),
  },
);

extension ThemeModeToFlexThemeMode on ThemeMode {
  bool get isLight {
    return switch (this) {
      ThemeMode.system => true,
      ThemeMode.light => true,
      ThemeMode.dark => false,
    };
  }
}

@riverpod
class ThemeConfig extends _$ThemeConfig {
  @override
  ThemeConfig build() {
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    _pref = ref.watch(sharedPreferencesProvider);
    return this;
  }

  final ThemeMode _defaultThemeMode = ThemeMode.light;

  final FlexScheme _defaultFlexScheme = FlexScheme.mandyRed;

  late SharedPreferences _pref;

  ThemeMode userThemeMode() {
    final String name = _pref.getString('themeMode') ?? _defaultThemeMode.name;
    return ThemeMode.values
        .where((ThemeMode element) => element.name == name)
        .first;
  }

  FlexScheme userFlexColorScheme() {
    final String? name = _pref.getString('userFlexColorScheme');
    return name == null
        ? _defaultFlexScheme
        : FlexScheme.values
            .where((FlexScheme element) => element.name == name)
            .first;
  }

  ThemeData userThemeData() {
    return userThemeMode().isLight
        ? FlexThemeData.light(
            // pageTransitionsTheme: _pageTransitionsTheme,
            scheme: userFlexColorScheme(),
            useMaterial3: true,
          )
        : FlexThemeData.dark(
            // pageTransitionsTheme: _pageTransitionsTheme,
            scheme: userFlexColorScheme(),
            useMaterial3: true,
          );
  }

  Future saveUserThemeMode(String newThemeModeName) async {
    await _pref.setString('themeMode', newThemeModeName);
    ref.notifyListeners();
  }

  Future saveUserThemeColorScheme(FlexScheme scheme) async {
    await _pref.setString('userFlexColorScheme', scheme.name);
    ref.notifyListeners();
  }
}
