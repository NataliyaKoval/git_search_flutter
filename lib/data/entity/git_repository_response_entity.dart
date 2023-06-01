import 'package:git_search/data/entity/git_repository_entity.dart';
import 'package:git_search/domain/models/git_repository_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'git_repository_response_entity.g.dart';

@JsonSerializable()
class GitRepositoryResponseEntity implements GitRepositoryResponse {
  GitRepositoryResponseEntity({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  //flutter pub run build_runner build
  factory GitRepositoryResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GitRepositoryResponseEntityFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;

  @override
  @JsonKey(name: 'incomplete_results')
  final bool incompleteResults;

  @override
  @JsonKey(name: 'items')
  final List<GitRepositoryEntity> items;
}
