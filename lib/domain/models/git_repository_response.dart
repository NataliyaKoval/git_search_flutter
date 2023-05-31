import 'package:git_search/domain/models/git_repository.dart';

class GitRepositoryResponse {
  const GitRepositoryResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<GitRepository> items;
}
