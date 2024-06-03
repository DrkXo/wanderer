import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:iconify_flutter_plus/icons/zondicons.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YtSearchVideoTile extends ConsumerWidget {
  const YtSearchVideoTile({
    super.key,
    required this.searchVideo,
  });
  final SearchVideo searchVideo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: searchVideo.thumbnails.first.url.toString(),
        height: 80,
        width: 60,
        alignment: Alignment.center,
      ),
      title: Text(
        searchVideo.title,
        maxLines: 2,
      ),
      subtitle: Text('Channel: ${searchVideo.author}'),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Iconify(MaterialSymbols.featured_video_outline_rounded),
          Text(searchVideo.duration),
        ],
      ),
    );
  }
}

class YtSearchChannelTile extends ConsumerWidget {
  const YtSearchChannelTile({
    super.key,
    required this.searchChannel,
  });
  final SearchChannel searchChannel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(searchChannel.name),
      subtitle: Text(searchChannel.description),
    );
  }
}

class YtSearchPlaylistTile extends ConsumerWidget {
  const YtSearchPlaylistTile({
    super.key,
    required this.searchPlaylist,
  });
  final SearchPlaylist searchPlaylist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: searchPlaylist.thumbnails.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: searchPlaylist.thumbnails.first.url.toString(),
              height: 80,
              width: 60,
              alignment: Alignment.center,
            )
          : const SizedBox.shrink(),
      title: Text(searchPlaylist.title),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Iconify(Zondicons.playlist),
          Text(searchPlaylist.videoCount.toString()),
        ],
      ),
    );
  }
}
