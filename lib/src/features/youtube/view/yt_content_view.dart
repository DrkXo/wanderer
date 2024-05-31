import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/features/youtube/widget/yt_videos_widget.dart';

class YtContentView extends ConsumerWidget {
  const YtContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Yt',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const YtVideosWidget(),
        ],
      ),
    );
  }
}
