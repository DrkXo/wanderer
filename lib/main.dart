import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanderer/src/common/model/db/custom_media_item.dart';
import 'package:wanderer/src/common/provider/shared_pref_provider/shared_pref_provider.dart';
import 'package:wanderer/src/wanderer.dart';

import 'src/common/provider/audio_handler/audio_handler.dart';
import 'src/common/repo/repo_keys/db_repo_keys.dart';

Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MediaItemDbAdapter());
  //await _cleanHive();
  log('Hive Initialized......');
}

// ignore: unused_element
Future<void> _cleanHive() async {
  final box1 = await Hive.openBox<MediaItemDb>(DbRepoKeys.history.name);
  box1.clear();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final audioHandler = await AudioService.init(
    builder: () => WandererAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.drkxo.wanderer',
      androidNotificationChannelName: 'Audio Service',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  //init the Hive

  await _initHive();

  runApp(
    ProviderScope(
      observers: const [
        // WandererProviderObserver(),
      ],
      overrides: [
        audioHandlerProvider.overrideWithValue(audioHandler),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const Wanderer(),
    ),
  );
}
