// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_repository_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitRepositoryResponseEntity _$GitRepositoryResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GitRepositoryResponseEntity(
      totalCount: json['total_count'] as int,
      incompleteResults: json['incomplete_results'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => GitRepositoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GitRepositoryResponseEntityToJson(
        GitRepositoryResponseEntity instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
