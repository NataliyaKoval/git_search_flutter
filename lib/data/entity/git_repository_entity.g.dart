// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_repository_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GitRepositoryEntityAdapter extends TypeAdapter<GitRepositoryEntity> {
  @override
  final int typeId = 1;

  @override
  GitRepositoryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GitRepositoryEntity(
      login: fields[0] as String,
      id: fields[1] as int,
      nodeId: fields[2] as String,
      avatarUrl: fields[3] as String,
      url: fields[4] as String,
      htmlUrl: fields[5] as String,
      reposUrl: fields[6] as String,
      type: fields[7] as String,
      score: fields[8] as num,
    );
  }

  @override
  void write(BinaryWriter writer, GitRepositoryEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.login)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.nodeId)
      ..writeByte(3)
      ..write(obj.avatarUrl)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.htmlUrl)
      ..writeByte(6)
      ..write(obj.reposUrl)
      ..writeByte(7)
      ..write(obj.type)
      ..writeByte(8)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitRepositoryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitRepositoryEntity _$GitRepositoryEntityFromJson(Map<String, dynamic> json) =>
    GitRepositoryEntity(
      login: json['login'] as String,
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      avatarUrl: json['avatar_url'] as String,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      reposUrl: json['repos_url'] as String,
      type: json['type'] as String,
      score: json['score'] as num,
    );

Map<String, dynamic> _$GitRepositoryEntityToJson(
        GitRepositoryEntity instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'repos_url': instance.reposUrl,
      'type': instance.type,
      'score': instance.score,
    };
