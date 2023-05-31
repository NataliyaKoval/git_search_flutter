import 'package:git_search/domain/models/git_repository_response.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/domain/use_case/use_case.dart';

class FetchGitRepositoriesUseCase
    extends UseCase<GitRepositoryResponse, GitRepoParams> {
  FetchGitRepositoriesUseCase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<GitRepositoryResponse> call(GitRepoParams params) async {
    return await repository.fetchGitRepositories(
      query: params.query,
      itemsCount: params.itemsCount,
    );
  }
}

class GitRepoParams {
  const GitRepoParams({
    required this.query,
    required this.itemsCount,
  });

  final String query;
  final int itemsCount;
}
