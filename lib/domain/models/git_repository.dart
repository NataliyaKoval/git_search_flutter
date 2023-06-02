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
    this.isFavorite = false,
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
  final bool isFavorite;

  GitRepository copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? url,
    String? htmlUrl,
    String? reposUrl,
    String? type,
    num? score,
    bool? isFavorite,
  }) {
    return GitRepository(
      login: login ?? this.login,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      type: type ?? this.type,
      score: score ?? this.score,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
