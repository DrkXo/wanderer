// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_media_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaItemDbAdapter extends TypeAdapter<MediaItemDb> {
  @override
  final int typeId = 0;

  @override
  MediaItemDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MediaItemDb(
      createdAt: fields[9] as DateTime?,
      album: fields[8] as String?,
      artHeaders: (fields[7] as Map?)?.cast<String, String>(),
      artUri: fields[6] as String?,
      artist: fields[5] as String?,
      duration: fields[4] as int?,
      extras: (fields[3] as Map?)?.cast<String, dynamic>(),
      genre: fields[2] as String?,
      id: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MediaItemDb obj) {
    writer
      ..writeByte(10)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.album)
      ..writeByte(7)
      ..write(obj.artHeaders)
      ..writeByte(6)
      ..write(obj.artUri)
      ..writeByte(5)
      ..write(obj.artist)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.extras)
      ..writeByte(2)
      ..write(obj.genre)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaItemDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
