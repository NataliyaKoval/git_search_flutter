import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/domain/use_case/use_case.dart';

class ToggleFavoritesUsecase extends UseCase<GitRepository, GitRepository> {
  ToggleFavoritesUsecase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<GitRepository> call(GitRepository params) async {
    if(!params.isFavorite) {
      repository.addToFavorites(params);
      return params.copyWith(isFavorite: true);
    } else {
      repository.removeFromFavorites(params);
      return params.copyWith(isFavorite: false);
    }
  }
}