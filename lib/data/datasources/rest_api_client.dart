import 'package:dio/dio.dart';
import 'package:git_search/data/entity/git_repository_response_entity.dart';
import 'package:retrofit/retrofit.dart';

// flutter pub run build_runner build
part 'rest_api_client.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class RestApiClient {
  factory RestApiClient(Dio dio, {String baseUrl}) = _RestApiClient;

  @GET('/search/users')
  Future<GitRepositoryResponseEntity> fetchRepository(
      @Query('q') String query, @Query('per_page') int itemsCount);
}