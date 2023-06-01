import 'package:git_search/data/datasources/rest_api_client.dart';
import 'package:git_search/data/entity/git_repository_response_entity.dart';
import 'package:git_search/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.restApiClient,
  });

  final RestApiClient restApiClient;

  @override
  Future<GitRepositoryResponseEntity> fetchGitRepositories(
      {required String query, required int itemsCount, required int page}) async {
    return await restApiClient.fetchRepository(query, itemsCount, page);
  }
}
