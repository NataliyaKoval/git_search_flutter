import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/presentation/favorite_screen/use_case/get_favorites_use_case.dart';
import 'package:git_search/presentation/favorite_screen/use_case/remove_favorite_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({
    required this.getFavoritesUseCase,
    required this.removeFavoritesUsecase,
  }) : super(FavoriteInitial());

  final GetFavoritesUseCase getFavoritesUseCase;
  final RemoveFavoritesUsecase removeFavoritesUsecase;

  List<GitRepository> mappedFavorites = [];

  Future<void> getFavorites() async {
    List<GitRepository> favorites = await getFavoritesUseCase.call();
    if (favorites.isNotEmpty) {
      mappedFavorites = favorites
          .map((gitRepo) => gitRepo.copyWith(isFavorite: true))
          .toList();
      emit(FavoriteLoaded(gitRepos: mappedFavorites));
    }
  }

  Future<void> removeFavorite (GitRepository gitRepository) async {
    try {
      removeFavoritesUsecase.call(gitRepository);
      mappedFavorites.removeWhere((element) => element.id == gitRepository.id);
      emit(FavoriteLoaded(gitRepos: mappedFavorites));
    } catch (e) {
      print(e);
    }
  }
}
