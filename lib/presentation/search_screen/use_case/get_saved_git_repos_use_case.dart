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
    return repository.getSavedGitRepos();
  }
}
