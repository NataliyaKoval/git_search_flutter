import 'package:git_search/domain/models/git_repository.dart';
import 'package:json_annotation/json_annotation.dart';

// flutter packages pub run build_runner build
part 'git_repository_entity.g.dart';

@JsonSerializable()
class GitRepositoryEntity implements GitRepository {
  const GitRepositoryEntity({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.url,
    required this.htmlUrl,
    required this.reposUrl,
    required this.type,
    required this.score,
  });

  //flutter pub run build_runner build
  factory GitRepositoryEntity.fromJson(Map<String, dynamic> json) =>
      _$GitRepositoryEntityFromJson(json);

  @override
  @JsonKey(name: 'login')
  final String login;

  @override
  @JsonKey(name: 'id')
  final int id;

  @override
  @JsonKey(name: 'node_id')
  final String nodeId;

  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @override
  @JsonKey(name: 'url')
  final String url;

  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;

  @override
  @JsonKey(name: 'repos_url')
  final String reposUrl;

  @override
  @JsonKey(name: 'type')
  final String type;

  @override
  @JsonKey(name: 'score')
  final num score;
}
