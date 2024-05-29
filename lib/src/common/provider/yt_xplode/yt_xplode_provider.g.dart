// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yt_xplode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ytXplodeHash() => r'b9ed9a22602234d229a050d01b2c888213d7316f';

/// See also [ytXplode].
@ProviderFor(ytXplode)
final ytXplodeProvider = Provider<YoutubeExplode>.internal(
  ytXplode,
  name: r'ytXplodeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ytXplodeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef YtXplodeRef = ProviderRef<YoutubeExplode>;
String _$ytVideoHash() => r'8f9cefdad8d5e6da2fc4af2273ca7f03e00ab4a1';

/// See also [ytVideo].
@ProviderFor(ytVideo)
final ytVideoProvider = AutoDisposeFutureProvider<Video>.internal(
  ytVideo,
  name: r'ytVideoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ytVideoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef YtVideoRef = AutoDisposeFutureProviderRef<Video>;
String _$ytRelatedVideosHash() => r'bfa5e321a750c96c856ae698d7850ca008498501';

/// See also [YtRelatedVideos].
@ProviderFor(YtRelatedVideos)
final ytRelatedVideosProvider = AutoDisposeAsyncNotifierProvider<
    YtRelatedVideos, RelatedVideosList?>.internal(
  YtRelatedVideos.new,
  name: r'ytRelatedVideosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ytRelatedVideosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$YtRelatedVideos = AutoDisposeAsyncNotifier<RelatedVideosList?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
