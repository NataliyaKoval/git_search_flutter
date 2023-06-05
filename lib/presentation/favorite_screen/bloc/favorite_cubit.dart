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
  List<int> removedFavoriteIndexes = [];

  Future<void> getFavorites() async {
    emit(FavoriteLoading());
    try {
      List<GitRepository> favorites = await getFavoritesUseCase.call();
      if (favorites.isNotEmpty) {
        mappedFavorites = favorites
            .map((gitRepo) => gitRepo.copyWith(isFavorite: true))
            .toList();
        emit(FavoriteLoaded(gitRepos: mappedFavorites));
      } else if (favorites.isEmpty) {
        emit(FavoriteEmpty());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeFavorite(GitRepository gitRepository) async {
    removedFavoriteIndexes.add(gitRepository.id);
    try {
      removeFavoritesUsecase.call(gitRepository);
      mappedFavorites.removeWhere((element) => element.id == gitRepository.id);
      if (mappedFavorites.isNotEmpty) {
        emit(FavoriteLoaded(gitRepos: mappedFavorites));
      } else {
        emit(FavoriteEmpty());
      }
    } catch (e) {
      print(e);
    }
  }
}
