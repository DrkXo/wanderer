import 'package:async_button_builder/async_button_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/common/provider/audio_controller/audio_controller.dart';
import 'package:wanderer/src/common/provider/yt_xplode/yt_xplode_provider.dart';
import 'package:wanderer/src/features/youtube/provider/youtube_search_notifier.dart';
import 'package:wanderer/src/utils/media_item_extention.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YtVideosWidget extends ConsumerStatefulWidget {
  const YtVideosWidget({
    super.key,
  });

  @override
  ConsumerState<YtVideosWidget> createState() => _YoutubeSearchViewState();
}

class _YoutubeSearchViewState extends ConsumerState<YtVideosWidget> {
  @override
  Widget build(BuildContext context) {
    final searchStateNotifier =
        ref.watch(ytSearchStateNotifierProvider.notifier);
    final searchKey = ref.watch(ytSearchStateNotifierProvider
        .select((selector) => selector.value?.searchQuery));

    final searchedVideos = ref.watch(ytSearchStateNotifierProvider
        .select((selector) => selector.value?.videoSearchList));

    return searchKey != null && searchKey.isNotEmpty
        ? ref.watch(ytVideoQueryProvider(searchKey)).when(
            data: (VideoSearchList data) {
              final tiles = searchedVideos?.map((Video f) {
                return ListTile(
                  onTap: () async {
                    final info = await ref
                        .read(ytStreamInfoFromIdProvider(f.id.value).future);

                    await ref
                        .read(audioPlayerNotifierProvider.notifier)
                        .startPlayListWithYoutubeMediaItem(
                      [
                        f.toMediaItem(url: info.url.toString()),
                      ],
                      0,
                    );
                  },
                  leading: CachedNetworkImage(
                    imageUrl: f.thumbnails.lowResUrl,
                    height: 80,
                    width: 60,
                    alignment: Alignment.center,
                  ),
                  //isThreeLine: true,
                  title: Text(
                    f.title,
                    maxLines: 2,
                  ),
                  subtitle: Text('Channel: ${f.author}'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
                );
              }).toList();

              return Column(
                //shrinkWrap: true,
                children: [
                  ...tiles ?? [],
                  AsyncButtonBuilder(
                    onPressed: () async {
                      await searchStateNotifier
                          .addVideoSearchListData(data.nextPage());
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
