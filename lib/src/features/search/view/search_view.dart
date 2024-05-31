import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:wanderer/src/router/router.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /* TypeAheadField<String>(
              controller: _textEditingController,
              suggestionsCallback: (search) => null,
              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text(
                      'Search',
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        if (_textEditingController.text.trim().isNotEmpty) {
                          router.pop(_textEditingController.text.trim());
                        }
                        ref.read(routerProvider).pop();
                      },
                      icon: const Icon(Icons.search_outlined),
                    ),
                  ),
                );
              },
              itemBuilder: (context, data) {
                return ListTile(
                  title: Text(data),
                );
              },
              onSelected: (value) {
                router.pop(_textEditingController.text.trim());
              },
            ), */
            FormBuilderChoiceChip(
              initialValue: "Yt",
              name: 'Type',
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: const Text(
                  'Search',
                ),
                suffix: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search_outlined),
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              options: const [
                FormBuilderChipOption(value: 'Yt'),
                FormBuilderChipOption(value: 'Others'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
