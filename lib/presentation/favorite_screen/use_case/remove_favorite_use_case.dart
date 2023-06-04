import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/domain/use_case/use_case.dart';

class RemoveFavoritesUsecase extends UseCase<void, GitRepository> {
  RemoveFavoritesUsecase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<void> call(GitRepository params) async {
    repository.removeFromFavorites(params);
  }
}