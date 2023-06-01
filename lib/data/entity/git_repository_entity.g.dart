// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_repository_entity.dart';

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
