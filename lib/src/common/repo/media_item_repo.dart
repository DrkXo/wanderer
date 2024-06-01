import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wanderer/src/common/model/db/custom_media_item.dart';
import 'package:wanderer/src/common/repo/repo_keys/db_repo_keys.dart';
part 'media_item_repo.g.dart';

@riverpod
Future<Box<MediaItemDb>> mediaItemHistoryDb(MediaItemHistoryDbRef ref) async {
  Box<MediaItemDb> historyBox =
      await Hive.openBox<MediaItemDb>(DbRepoKeys.history.name);
  ref.onDispose(() {
    historyBox.close();
  });
  return historyBox;
}
