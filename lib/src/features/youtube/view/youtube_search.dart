import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/common/provider/audio_controller/audio_controller.dart';
import 'package:wanderer/src/common/provider/yt_xplode/yt_xplode_provider.dart';
import 'package:wanderer/src/features/youtube/provider/youtube_search_notifier.dart';
import 'package:wanderer/src/utils/media_item_extention.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeContentView extends ConsumerStatefulWidget {
  const YoutubeContentView({
    super.key,
  });

  @override
  ConsumerState<YoutubeContentView> createState() => _YoutubeSearchViewState();
}

class _YoutubeSearchViewState extends ConsumerState<YoutubeContentView> {
  @override
  Widget build(BuildContext context) {
    final searchStateNotifier =
        ref.watch(ytSearchStateNotifierProvider.notifier);
    final searchKey = ref.watch(ytSearchStateNotifierProvider
        .select((selector) => selector.value?.searchQuery));

    final searchedVideos = ref.watch(ytSearchStateNotifierProvider
        .select((selector) => selector.value?.videoSearchList));

    return searchKey != null
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
                  leading: SizedBox(
                    height: 20,
                    width: 30,
                    child: CachedNetworkImage(
                      imageUrl: f.thumbnails.lowResUrl,
                    ),
                  ),
                  title: Text(f.title),
                );
              }).toList();

              return ListView(
                shrinkWrap: true,
                children: [
                  ...tiles ?? [],
                  IconButton(
                    onPressed: () async {
                      searchStateNotifier
                          .addVideoSearchListData(data.nextPage());
                    },
                    icon: const Icon(Icons.arrow_right),
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
