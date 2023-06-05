import 'package:flutter/material.dart';
import 'package:git_search/domain/models/git_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/domain/models/git_repository_response.dart';
import 'package:git_search/domain/models/history_item.dart';
import 'package:git_search/presentation/search_screen/use_case/fetch_git_repositories_use_case.dart';
import 'package:git_search/presentation/search_screen/use_case/get_saved_queries_use_case.dart';
import 'package:git_search/presentation/search_screen/use_case/save_query_use_case.dart';
import 'package:git_search/presentation/search_screen/use_case/toggle_favorites_use_case.dart';
import 'package:git_search/presentation/use_cases/get_favorites_use_case.dart';
import 'package:git_search/utils/app_error.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.fetchGitRepositoriesUseCase,
    required this.toggleFavoritesUsecase,
    required this.saveQueryUseCase,
    required this.getSavedQueriesUseCase,
    required this.getFavoritesUseCase,
  }) : super(SearchInitial());

  final FetchGitRepositoriesUseCase fetchGitRepositoriesUseCase;
  final ToggleFavoritesUsecase toggleFavoritesUsecase;
  final SaveQueryUseCase saveQueryUseCase;
  final GetSavedQueriesUseCase getSavedQueriesUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;

  static const int _itemsCount = 15;
  int page = 1;
  bool isLastPage = false;
  List<GitRepository> allGitRepos = <GitRepository>[];
  bool isFutureRunning = false;

  Future<void> saveQuery(String query) async {
    try {
      saveQueryUseCase.call(query);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getQueriesHistory() async {
    try {
      Set<String> queries = await getSavedQueriesUseCase.call();
      List<GitRepository> favorites = await getFavoritesUseCase.call();
      List<String> favoriteLogins = favorites.map((favorite) => favorite.login).toList();
      List<HistoryItem> historyItems = queries.map((query) {
        if (favoriteLogins.contains(query)) {
          return HistoryItem(name: query, isFavorite: true);
        } else {
          return HistoryItem(name: query, isFavorite: false);
        }
      }).toList();
      emit(HistoryLoaded(historyItems: historyItems));
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchGitRepositories(String query) async {
    if (isFutureRunning) {
      return;
    }

    isFutureRunning = true;
    emit(SearchLoading());
    try {
      GitRepositoryResponse response =
          await fetchGitRepositoriesUseCase.call(GitRepoParams(
        query: query,
        itemsCount: _itemsCount,
        page: page,
      ));
      List<GitRepository> gitRepos = response.items;
      allGitRepos = gitRepos;
      emit(
        SearchLoaded(gitRepositories: allGitRepos, isLastPage: isLastPage),
      );
    } on AppError catch (e) {
      emit(SearchError(message: e.message));
    } finally {
      isFutureRunning = false;
    }
  }

  Future<void> fetchNextGitRepositories(String query) async {
    if (isFutureRunning) {
      return;
    }

    isFutureRunning = true;

    try {
      GitRepositoryResponse response =
          await fetchGitRepositoriesUseCase.call(GitRepoParams(
        query: query,
        itemsCount: _itemsCount,
        page: page,
      ));
      List<GitRepository> gitRepos = response.items;
      if (response.incompleteResults == true) {
        isLastPage = true;
      }
      allGitRepos.addAll(gitRepos);
      page++;
      emit(
        SearchLoaded(gitRepositories: allGitRepos, isLastPage: isLastPage),
      );
    } on AppError catch (e) {
      emit(SearchError(message: e.message));
    } finally {
      isFutureRunning = false;
    }
  }

  Future<void> toggleFavorite(GitRepository gitRepository) async {
    try {
      GitRepository changedGitRepository =
          await toggleFavoritesUsecase.call(gitRepository);

      final index =
          allGitRepos.indexWhere((element) => element.id == gitRepository.id);
      allGitRepos[index] = changedGitRepository;
      emit(
        SearchLoaded(gitRepositories: allGitRepos, isLastPage: isLastPage),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateListAfterRemovingFavorites(
      List<int> removedFavorites) async {
    List<GitRepository> newList = allGitRepos.map((e) {
      if (removedFavorites.contains(e.id)) {
        return e.copyWith(isFavorite: false);
      } else {
        return e;
      }
    }).toList();
    allGitRepos = newList;
    emit(
      SearchLoaded(gitRepositories: allGitRepos, isLastPage: isLastPage),
    );
  }
}
