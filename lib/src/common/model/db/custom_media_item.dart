import 'package:audio_service/audio_service.dart';
import 'package:hive/hive.dart';
part 'custom_media_item.g.dart';

@HiveType(typeId: 0)
class MediaItemDb extends HiveObject {
  @HiveField(9)
  DateTime? createdAt;

  @HiveField(8)
  String? album;

  @HiveField(7)
  Map<String, String>? artHeaders;

  @HiveField(6)
  Uri? artUri;

  @HiveField(5)
  String? artist;

  @HiveField(4)
  Duration? duration;

  @HiveField(3)
  Map<String, dynamic>? extras;

  @HiveField(2)
  String? genre;

  @HiveField(1)
  String title;

  @HiveField(0)
  String id;

  MediaItemDb({
    this.createdAt,
    this.album,
    this.artHeaders,
    this.artUri,
    this.artist,
    this.duration,
    this.extras,
    this.genre,
    required this.id,
    required this.title,
  });

  MediaItemDb copyWith({
    DateTime? createdAt,
    String? album,
    Map<String, String>? artHeaders,
    Uri? artUri,
    String? artist,
    String? displayDescription,
    String? displaySubtitle,
    String? displayTitle,
    Duration? duration,
    Map<String, dynamic>? extras,
    String? genre,
    String? id,
    String? title,
  }) {
    return MediaItemDb(
      createdAt: createdAt ?? this.createdAt,
      album: album ?? this.album,
      artHeaders: artHeaders ?? this.artHeaders,
      artUri: artUri ?? this.artUri,
      artist: artist ?? this.artist,
      duration: duration ?? this.duration,
      extras: extras ?? this.extras,
      genre: genre ?? this.genre,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  MediaItem toMediaItem() {
    return MediaItem(
      id: id,
      title: title,
      duration: duration,
      artHeaders: artHeaders,
      artUri: artUri,
      genre: genre,
      album: album,
      artist: artist,
      extras: extras,
    );
  }

  factory MediaItemDb.fromMediaItem(MediaItem mediaItem) {
    return MediaItemDb(
      id: mediaItem.id,
      title: mediaItem.title,
      duration: mediaItem.duration,
      artHeaders: mediaItem.artHeaders,
      artUri: mediaItem.artUri,
      genre: mediaItem.genre,
      album: mediaItem.album,
      artist: mediaItem.artist,
      extras: mediaItem.extras,
      createdAt: DateTime.now(),
    );
  }
}
