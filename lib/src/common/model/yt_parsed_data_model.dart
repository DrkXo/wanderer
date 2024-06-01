import 'package:youtube_explode_dart/youtube_explode_dart.dart';

/*   if (quality == 'low') {
      qualityIndex = 0;
    } else if (quality == 'medium') {
      qualityIndex = (audioStreamInfos.length / 2).floor();
    } else {
      qualityIndex = audioStreamInfos.length - 1;
    } */

class YtParsedData {
  final StreamManifest manifest;
  late List<AudioOnlyStreamInfo> audioStreamInfos;
  late List<VideoOnlyStreamInfo> videoStreamInfos;
  String videoId;

  int audioQualityIndex = 0;
  int videoQualityIndex = 0;
  YtParsedData({
    required this.manifest,
    required this.videoId,
    this.audioQualityIndex = 0,
    this.videoQualityIndex = 0,
  }) {
    audioStreamInfos = manifest.audioOnly.sortByBitrate().reversed.toList();
    videoStreamInfos = manifest.videoOnly.sortByBitrate().reversed.toList();
  }

  YtParsedData copyWith({
    StreamManifest? manifest,
    String? videoId,
    int? audioQualityIndex,
    int? videoQualityIndex,
  }) {
    return YtParsedData(
      manifest: manifest ?? this.manifest,
      videoId: videoId ?? this.videoId,
      audioQualityIndex: audioQualityIndex ?? this.audioQualityIndex,
      videoQualityIndex: videoQualityIndex ?? this.videoQualityIndex,
    );
  }

  AudioOnlyStreamInfo get audioStreamInfo =>
      audioStreamInfos[audioQualityIndex];

  VideoOnlyStreamInfo get videoStreamInfo =>
      videoStreamInfos[videoQualityIndex];
}
