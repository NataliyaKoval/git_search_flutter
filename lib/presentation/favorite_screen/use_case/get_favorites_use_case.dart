import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/domain/use_case/use_case.dart';

class GetFavoritesUseCase extends NoParamsUseCase<List<GitRepository>> {
  GetFavoritesUseCase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<List<GitRepository>> call() async {
    return repository.getFavorites();
  }
}
