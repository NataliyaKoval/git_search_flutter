import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/domain/use_case/use_case.dart';

class GetSavedGitReposUseCase extends NoParamsUseCase<List<GitRepository>> {
  GetSavedGitReposUseCase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<List<GitRepository>> call() async {
    List<GitRepository> savedRepos = await repository.getSavedGitRepos();
    List<dynamic> keys = repository.getFavoritesKeys();
    List<GitRepository> changedGitRepos = savedRepos.reversed.map((repo) {
      if (keys.contains(repo.id)) {
        return repo.copyWith(isFavorite: true);
      } else {
        return repo;
      }
    }).toList();
    return changedGitRepos;
  }
}
