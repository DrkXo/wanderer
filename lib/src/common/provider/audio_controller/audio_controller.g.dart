// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$audioPlayerHash() => r'80e3e0754910652cde984734fcad9d705060783c';

/// See also [audioPlayer].
@ProviderFor(audioPlayer)
final audioPlayerProvider = Provider<PlayListState>.internal(
  audioPlayer,
  name: r'audioPlayerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$audioPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AudioPlayerRef = ProviderRef<PlayListState>;
String _$audioPlayerNotifierHash() =>
    r'0f02f14b721cb2d2e3efdaed576dc5de06af87a9';

/// See also [AudioPlayerNotifier].
@ProviderFor(AudioPlayerNotifier)
final audioPlayerNotifierProvider =
    NotifierProvider<AudioPlayerNotifier, PlayListState>.internal(
  AudioPlayerNotifier.new,
  name: r'audioPlayerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioPlayerNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AudioPlayerNotifier = Notifier<PlayListState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
