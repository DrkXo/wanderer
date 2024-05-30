import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'youtube_search_notifier.g.dart';

@riverpod
class YtSearchKey extends _$YtSearchKey {
  void update(String? val) {
    state = val;
  }

  @override
  String? build() => null;
}
