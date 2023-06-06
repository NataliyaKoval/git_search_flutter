import 'package:git_search/data/datasources/local_database.dart';
import 'package:git_search/data/datasources/rest_api_client.dart';
import 'package:git_search/data/entity/git_repository_entity.dart';
import 'package:git_search/data/entity/git_repository_response_entity.dart';
import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/domain/models/git_repository_response.dart';
import 'package:git_search/domain/repository/repository.dart';

import '../../utils/app_error.dart';

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.restApiClient,
    required this.localDatabase,
  });

  final RestApiClient restApiClient;
  final LocalDatabase localDatabase;

  @override
  Future<GitRepositoryResponse> fetchAndSaveGitRepositories({
    required String query,
    required int itemsCount,
    required int page,
  }) async {
    GitRepositoryResponseEntity response = await execute(
        () => restApiClient.fetchRepository(query, itemsCount, page));

    return response;
  }

  @override
  Future<void> saveQuery(String query) async {
    localDatabase.saveQuery(query);
  }

  @override
  Future<List<String>> getSavedQueries() async {
    return localDatabase.getSavedQueries();
  }

  @override
  void addToFavorites(GitRepository gitRepository) {
    localDatabase
        .addToFavorites(GitRepositoryEntity.fromGitRepository(gitRepository));
  }

  @override
  List<GitRepository> getFavorites() {
    return localDatabase.getFavorites();
  }

  @override
  void removeFromFavorites(GitRepository gitRepository) {
    localDatabase.removeFromFavorites(gitRepository.id);
  }

  @override
  List getFavoritesKeys() {
    return localDatabase.getFavoritesKeys();
  }
}
