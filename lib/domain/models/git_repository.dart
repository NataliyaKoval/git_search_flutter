class GitRepository {
  const GitRepository({
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

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String url;
  final String htmlUrl;
  final String reposUrl;
  final String type;
  final num score;
}
