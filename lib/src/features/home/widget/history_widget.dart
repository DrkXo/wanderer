import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderer/src/common/repo/media_item_repo.dart';

class HistoryWidget extends ConsumerWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(mediaItemHistoryProvider).when(
      data: (items) {
        return items.isNotEmpty
            ? RefreshIndicator.adaptive(
                onRefresh: () async {
                  ref.invalidate(mediaItemHistoryProvider);
                },
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'History',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    ...items.map(
                      (e) => ListTile(
                        title: Text(e.title),
                        subtitle: Text('${e.artist}'),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
      error: (error, s) {
        return Text('$error');
      },
      loading: () {
        return const LinearProgressIndicator();
      },
    );
  }
}
