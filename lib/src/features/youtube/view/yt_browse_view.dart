import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/yt_all_content_search.dart';

class YtBrowseView extends ConsumerWidget {
  const YtBrowseView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.explore_outlined),
              Text(
                'Yt',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          const YtSearchContentsWidget(),
          //const YtVideosWidget(),
        ],
      ),
    );
  }
}
