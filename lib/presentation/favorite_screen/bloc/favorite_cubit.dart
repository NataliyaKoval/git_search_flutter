import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/presentation/favorite_screen/use_case/get_favorites_use_case.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.getFavoritesUseCase}) : super(FavoriteInitial());

  final GetFavoritesUseCase getFavoritesUseCase;

  Future<void> getFavorites() async {
    List<GitRepository> favoriteGitRepos = await getFavoritesUseCase.call();
    if (favoriteGitRepos.isNotEmpty) {
      emit(FavoriteLoaded(gitRepos: favoriteGitRepos));
    }
  }
}
