import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../provider/yt_xplode/yt_xplode_provider.dart';

class WandererSearchbar extends ConsumerWidget {
  const WandererSearchbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TypeAheadField<String>(
      suggestionsCallback: (search) async {
        if (search.trim().isNotEmpty) {
          return await ref
              .watch(ytVideoQuerySuggestionProvider(search.trim()).future)
              .then((onValue) => onValue);
        }
        return null;
      },
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Search',
            prefix: IconButton(
              onPressed: () {
                focusNode.unfocus();
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                focusNode.unfocus();
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
          ),
        );
      },
      itemBuilder: (context, data) {
        return ListTile(
          title: Text(data),
        );
      },
      onSelected: (data) {},
    );
  }
}
