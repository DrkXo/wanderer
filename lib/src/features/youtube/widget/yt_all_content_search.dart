// ignore_for_file: prefer_const_constructors

import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/common/extentions/yt_search_extentions.dart';
import 'package:wanderer/src/common/provider/yt_xplode/yt_xplode_provider.dart';
import 'package:wanderer/src/common/widget/yt_search_result_tiles.dart';
import 'package:wanderer/src/features/youtube/provider/youtube_search_notifier.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YtSearchContentsWidget extends ConsumerStatefulWidget {
  const YtSearchContentsWidget({
    super.key,
  });

  @override
  ConsumerState<YtSearchContentsWidget> createState() =>
      _YoutubeSearchViewState();
}

class _YoutubeSearchViewState extends ConsumerState<YtSearchContentsWidget> {
  @override
  Widget build(BuildContext context) {
    final searchStateNotifier =
        ref.watch(ytSearchStateNotifierProvider.notifier);
    final searchKey = ref.watch(ytSearchStateNotifierProvider
        .select((selector) => selector.value?.searchQuery));

    final searchedContent = ref.watch(ytSearchStateNotifierProvider
        .select((selector) => selector.value?.searchList));

    return searchKey != null && searchKey.isNotEmpty
        ? ref.watch(ytContentQueryProvider(searchKey)).when(
            data: (SearchList data) {
              if (searchedContent != null && searchedContent.isNotEmpty) {
                List<Widget> tiles = [];
                for (var x in searchedContent) {
                  final eachSearchResult = x.mapResultsIntoList;
                  for (var y in eachSearchResult) {
                    if (y is SearchVideo) {
                      tiles.add(YtSearchVideoTile(searchVideo: y));
                    } else if (y is SearchPlaylist) {
                      tiles.add(YtSearchPlaylistTile(searchPlaylist: y));
                    } else if (y is SearchChannel) {
                      tiles.add(YtSearchChannelTile(searchChannel: y));
                    }
                  }
                }
                return Column(
                  children: [
                    ...tiles,
                    AsyncButtonBuilder(
                      onPressed: () async {
                        await searchStateNotifier.addSearchListData(
                          data.nextPage(),
                        );
                      },
                      loadingWidget: const LinearProgressIndicator(),
                      builder: (context, child, callback, _) {
                        return TextButton(
                          onPressed: callback,
                          child: child,
                        );
                      },
                      child: const Text('Load More'),
                    ),
                  ],
                );
              } else {
                return SizedBox.shrink();
              }
            },
            error: (error, s) {
              return Text('$error');
            },
            loading: () {
              return const Column(
                children: [
                  LinearProgressIndicator(),
                ],
              );
            },
          )
        : const SizedBox.shrink();
  }
}
