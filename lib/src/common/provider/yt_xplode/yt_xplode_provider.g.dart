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
String _$ytVideoSearchListHash() => r'9e9afb8e86c8de004fc16bfb65f6058d4af786af';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [ytVideoSearchList].
@ProviderFor(ytVideoSearchList)
const ytVideoSearchListProvider = YtVideoSearchListFamily();

/// See also [ytVideoSearchList].
class YtVideoSearchListFamily extends Family<AsyncValue<SearchList>> {
  /// See also [ytVideoSearchList].
  const YtVideoSearchListFamily();

  /// See also [ytVideoSearchList].
  YtVideoSearchListProvider call(
    String searchQuery,
  ) {
    return YtVideoSearchListProvider(
      searchQuery,
    );
  }

  @override
  YtVideoSearchListProvider getProviderOverride(
    covariant YtVideoSearchListProvider provider,
  ) {
    return call(
      provider.searchQuery,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ytVideoSearchListProvider';
}

/// See also [ytVideoSearchList].
class YtVideoSearchListProvider extends AutoDisposeFutureProvider<SearchList> {
  /// See also [ytVideoSearchList].
  YtVideoSearchListProvider(
    String searchQuery,
  ) : this._internal(
          (ref) => ytVideoSearchList(
            ref as YtVideoSearchListRef,
            searchQuery,
          ),
          from: ytVideoSearchListProvider,
          name: r'ytVideoSearchListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ytVideoSearchListHash,
          dependencies: YtVideoSearchListFamily._dependencies,
          allTransitiveDependencies:
              YtVideoSearchListFamily._allTransitiveDependencies,
          searchQuery: searchQuery,
        );

  YtVideoSearchListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchQuery,
  }) : super.internal();

  final String searchQuery;

  @override
  Override overrideWith(
    FutureOr<SearchList> Function(YtVideoSearchListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: YtVideoSearchListProvider._internal(
        (ref) => create(ref as YtVideoSearchListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchQuery: searchQuery,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SearchList> createElement() {
    return _YtVideoSearchListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is YtVideoSearchListProvider &&
        other.searchQuery == searchQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin YtVideoSearchListRef on AutoDisposeFutureProviderRef<SearchList> {
  /// The parameter `searchQuery` of this provider.
  String get searchQuery;
}

class _YtVideoSearchListProviderElement
    extends AutoDisposeFutureProviderElement<SearchList>
    with YtVideoSearchListRef {
  _YtVideoSearchListProviderElement(super.provider);

  @override
  String get searchQuery => (origin as YtVideoSearchListProvider).searchQuery;
}

String _$ytVideoHash() => r'4b4e7a6f66067254f626c791b32269fc53a93fd9';

/// See also [ytVideo].
@ProviderFor(ytVideo)
const ytVideoProvider = YtVideoFamily();

/// See also [ytVideo].
class YtVideoFamily extends Family<AsyncValue<Video>> {
  /// See also [ytVideo].
  const YtVideoFamily();

  /// See also [ytVideo].
  YtVideoProvider call(
    String id,
  ) {
    return YtVideoProvider(
      id,
    );
  }

  @override
  YtVideoProvider getProviderOverride(
    covariant YtVideoProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ytVideoProvider';
}

/// See also [ytVideo].
class YtVideoProvider extends AutoDisposeFutureProvider<Video> {
  /// See also [ytVideo].
  YtVideoProvider(
    String id,
  ) : this._internal(
          (ref) => ytVideo(
            ref as YtVideoRef,
            id,
          ),
          from: ytVideoProvider,
          name: r'ytVideoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ytVideoHash,
          dependencies: YtVideoFamily._dependencies,
          allTransitiveDependencies: YtVideoFamily._allTransitiveDependencies,
          id: id,
        );

  YtVideoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Video> Function(YtVideoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: YtVideoProvider._internal(
        (ref) => create(ref as YtVideoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Video> createElement() {
    return _YtVideoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is YtVideoProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin YtVideoRef on AutoDisposeFutureProviderRef<Video> {
  /// The parameter `id` of this provider.
  String get id;
}

class _YtVideoProviderElement extends AutoDisposeFutureProviderElement<Video>
    with YtVideoRef {
  _YtVideoProviderElement(super.provider);

  @override
  String get id => (origin as YtVideoProvider).id;
}

String _$ytStreamInfoFromIdHash() =>
    r'78de6dc32fddaa4e3c7e217cf871c9d330c7733b';

/// See also [ytStreamInfoFromId].
@ProviderFor(ytStreamInfoFromId)
const ytStreamInfoFromIdProvider = YtStreamInfoFromIdFamily();

/// See also [ytStreamInfoFromId].
class YtStreamInfoFromIdFamily extends Family<AsyncValue<StreamInfo>> {
  /// See also [ytStreamInfoFromId].
  const YtStreamInfoFromIdFamily();

  /// See also [ytStreamInfoFromId].
  YtStreamInfoFromIdProvider call(
    String id,
  ) {
    return YtStreamInfoFromIdProvider(
      id,
    );
  }

  @override
  YtStreamInfoFromIdProvider getProviderOverride(
    covariant YtStreamInfoFromIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ytStreamInfoFromIdProvider';
}

/// See also [ytStreamInfoFromId].
class YtStreamInfoFromIdProvider extends AutoDisposeFutureProvider<StreamInfo> {
  /// See also [ytStreamInfoFromId].
  YtStreamInfoFromIdProvider(
    String id,
  ) : this._internal(
          (ref) => ytStreamInfoFromId(
            ref as YtStreamInfoFromIdRef,
            id,
          ),
          from: ytStreamInfoFromIdProvider,
          name: r'ytStreamInfoFromIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ytStreamInfoFromIdHash,
          dependencies: YtStreamInfoFromIdFamily._dependencies,
          allTransitiveDependencies:
              YtStreamInfoFromIdFamily._allTransitiveDependencies,
          id: id,
        );

  YtStreamInfoFromIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<StreamInfo> Function(YtStreamInfoFromIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: YtStreamInfoFromIdProvider._internal(
        (ref) => create(ref as YtStreamInfoFromIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<StreamInfo> createElement() {
    return _YtStreamInfoFromIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is YtStreamInfoFromIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin YtStreamInfoFromIdRef on AutoDisposeFutureProviderRef<StreamInfo> {
  /// The parameter `id` of this provider.
  String get id;
}

class _YtStreamInfoFromIdProviderElement
    extends AutoDisposeFutureProviderElement<StreamInfo>
    with YtStreamInfoFromIdRef {
  _YtStreamInfoFromIdProviderElement(super.provider);

  @override
  String get id => (origin as YtStreamInfoFromIdProvider).id;
}

String _$ytVideoQuerySuggestionHash() =>
    r'd6e59e5439832818683330da8447779895b95984';

/// See also [ytVideoQuerySuggestion].
@ProviderFor(ytVideoQuerySuggestion)
const ytVideoQuerySuggestionProvider = YtVideoQuerySuggestionFamily();

/// See also [ytVideoQuerySuggestion].
class YtVideoQuerySuggestionFamily extends Family<AsyncValue<List<String>>> {
  /// See also [ytVideoQuerySuggestion].
  const YtVideoQuerySuggestionFamily();

  /// See also [ytVideoQuerySuggestion].
  YtVideoQuerySuggestionProvider call(
    String searchQuery,
  ) {
    return YtVideoQuerySuggestionProvider(
      searchQuery,
    );
  }

  @override
  YtVideoQuerySuggestionProvider getProviderOverride(
    covariant YtVideoQuerySuggestionProvider provider,
  ) {
    return call(
      provider.searchQuery,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ytVideoQuerySuggestionProvider';
}

/// See also [ytVideoQuerySuggestion].
class YtVideoQuerySuggestionProvider
    extends AutoDisposeFutureProvider<List<String>> {
  /// See also [ytVideoQuerySuggestion].
  YtVideoQuerySuggestionProvider(
    String searchQuery,
  ) : this._internal(
          (ref) => ytVideoQuerySuggestion(
            ref as YtVideoQuerySuggestionRef,
            searchQuery,
          ),
          from: ytVideoQuerySuggestionProvider,
          name: r'ytVideoQuerySuggestionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ytVideoQuerySuggestionHash,
          dependencies: YtVideoQuerySuggestionFamily._dependencies,
          allTransitiveDependencies:
              YtVideoQuerySuggestionFamily._allTransitiveDependencies,
          searchQuery: searchQuery,
        );

  YtVideoQuerySuggestionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchQuery,
  }) : super.internal();

  final String searchQuery;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(YtVideoQuerySuggestionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: YtVideoQuerySuggestionProvider._internal(
        (ref) => create(ref as YtVideoQuerySuggestionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchQuery: searchQuery,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _YtVideoQuerySuggestionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is YtVideoQuerySuggestionProvider &&
        other.searchQuery == searchQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin YtVideoQuerySuggestionRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `searchQuery` of this provider.
  String get searchQuery;
}

class _YtVideoQuerySuggestionProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with YtVideoQuerySuggestionRef {
  _YtVideoQuerySuggestionProviderElement(super.provider);

  @override
  String get searchQuery =>
      (origin as YtVideoQuerySuggestionProvider).searchQuery;
}

String _$ytVideoQueryHash() => r'1ccc187d4142cfaf77ef687cc3abe1a74d00febc';

/// See also [ytVideoQuery].
@ProviderFor(ytVideoQuery)
const ytVideoQueryProvider = YtVideoQueryFamily();

/// See also [ytVideoQuery].
class YtVideoQueryFamily extends Family<AsyncValue<VideoSearchList>> {
  /// See also [ytVideoQuery].
  const YtVideoQueryFamily();

  /// See also [ytVideoQuery].
  YtVideoQueryProvider call(
    String searchQuery,
  ) {
    return YtVideoQueryProvider(
      searchQuery,
    );
  }

  @override
  YtVideoQueryProvider getProviderOverride(
    covariant YtVideoQueryProvider provider,
  ) {
    return call(
      provider.searchQuery,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ytVideoQueryProvider';
}

/// See also [ytVideoQuery].
class YtVideoQueryProvider extends AutoDisposeFutureProvider<VideoSearchList> {
  /// See also [ytVideoQuery].
  YtVideoQueryProvider(
    String searchQuery,
  ) : this._internal(
          (ref) => ytVideoQuery(
            ref as YtVideoQueryRef,
            searchQuery,
          ),
          from: ytVideoQueryProvider,
          name: r'ytVideoQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ytVideoQueryHash,
          dependencies: YtVideoQueryFamily._dependencies,
          allTransitiveDependencies:
              YtVideoQueryFamily._allTransitiveDependencies,
          searchQuery: searchQuery,
        );

  YtVideoQueryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchQuery,
  }) : super.internal();

  final String searchQuery;

  @override
  Override overrideWith(
    FutureOr<VideoSearchList> Function(YtVideoQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: YtVideoQueryProvider._internal(
        (ref) => create(ref as YtVideoQueryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchQuery: searchQuery,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<VideoSearchList> createElement() {
    return _YtVideoQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is YtVideoQueryProvider && other.searchQuery == searchQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin YtVideoQueryRef on AutoDisposeFutureProviderRef<VideoSearchList> {
  /// The parameter `searchQuery` of this provider.
  String get searchQuery;
}

class _YtVideoQueryProviderElement
    extends AutoDisposeFutureProviderElement<VideoSearchList>
    with YtVideoQueryRef {
  _YtVideoQueryProviderElement(super.provider);

  @override
  String get searchQuery => (origin as YtVideoQueryProvider).searchQuery;
}

String _$ytSearchStateNotifierHash() =>
    r'b97c5d0ba9977eaddfe030c3232f75482f27b0a9';

/// See also [YtSearchStateNotifier].
@ProviderFor(YtSearchStateNotifier)
final ytSearchStateNotifierProvider = AutoDisposeNotifierProvider<
    YtSearchStateNotifier, YtSearchModelState>.internal(
  YtSearchStateNotifier.new,
  name: r'ytSearchStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ytSearchStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$YtSearchStateNotifier = AutoDisposeNotifier<YtSearchModelState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
