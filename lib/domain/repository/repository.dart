import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/domain/models/git_repository_response.dart';

abstract class Repository {
  Future<GitRepositoryResponse> fetchAndSaveGitRepositories(
      {required String query, required int itemsCount, required int page});

  Future<void> saveQuery(String query);

  Future<List<String>> getSavedQueries();

  void addToFavorites(GitRepository gitRepository);

  void removeFromFavorites(GitRepository gitRepository);

  List<GitRepository> getFavorites();

  List getFavoritesKeys();
}
