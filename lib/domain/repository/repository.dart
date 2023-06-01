import 'package:git_search/data/entity/git_repository_response_entity.dart';

abstract class Repository {
  Future<GitRepositoryResponseEntity> fetchGitRepositories(
      {required String query, required int itemsCount, required int page});
}
