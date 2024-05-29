import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/wanderer.dart';

import 'src/common/provider/audio_handler/audio_handler.dart';

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

  runApp(
    ProviderScope(
      overrides: [
        audioHandlerProvider.overrideWithValue(audioHandler),
      ],
      child: const Wanderer(),
    ),
  );
}
