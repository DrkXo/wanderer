import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/provider/audio_controller/audio_controller.dart';

class PlayerMaximizedView extends ConsumerStatefulWidget {
  const PlayerMaximizedView({super.key});

  @override
  ConsumerState<PlayerMaximizedView> createState() =>
      _YtPlayerMaximizedViewState();
}

class _YtPlayerMaximizedViewState extends ConsumerState<PlayerMaximizedView> {
  OverlayPortalController overlayPortalController = OverlayPortalController();
  final ScrollController scrollController = ScrollController();
  bool showControls = false;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentSong =
        ref.watch(audioPlayerProvider.select((value) => value.currentSong));

    final playeListTimers =
        ref.watch(audioPlayerProvider.select((value) => value));
    final playing =
        ref.watch(audioPlayerProvider.select((value) => value.playing));
    final audioPlayerNotifier = ref.watch(audioPlayerNotifierProvider.notifier);

    if (currentSong == null) {
      return const SizedBox.shrink();
    } else {
      return Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              pinned: true,
              snap: true,
              floating: true,
              collapsedHeight: MediaQuery.of(context).size.height / 3,
              expandedHeight: MediaQuery.of(context).size.height / 3,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  currentSong.title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                background: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 26, 0, 0),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.grey.withOpacity(.5),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ).createShader(bounds);
                    },
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: currentSong.artUri.toString(),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(
                          Icons.error_outline,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${index + 1}.'),
                );
              },
            ),
          ],
        ),
      );
    }
  }
}
