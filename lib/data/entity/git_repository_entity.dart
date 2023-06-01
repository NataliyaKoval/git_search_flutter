import 'package:git_search/domain/models/git_repository.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// flutter packages pub run build_runner build
part 'git_repository_entity.g.dart';

@HiveType(typeId: 1)
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

  @HiveField(0)
  @override
  @JsonKey(name: 'login')
  final String login;

  @HiveField(1)
  @override
  @JsonKey(name: 'id')
  final int id;

  @HiveField(2)
  @override
  @JsonKey(name: 'node_id')
  final String nodeId;

  @HiveField(3)
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @HiveField(4)
  @override
  @JsonKey(name: 'url')
  final String url;

  @HiveField(5)
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;

  @HiveField(6)
  @override
  @JsonKey(name: 'repos_url')
  final String reposUrl;

  @HiveField(7)
  @override
  @JsonKey(name: 'type')
  final String type;

  @HiveField(8)
  @override
  @JsonKey(name: 'score')
  final num score;
}
