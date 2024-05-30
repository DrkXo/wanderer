// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_service/audio_service.dart';

class YtMediaItem extends MediaItem {
  final Uri uri;

  YtMediaItem({
    required this.uri,
    required super.id,
    required super.title,
  });
}
