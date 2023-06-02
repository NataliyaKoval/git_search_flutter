import 'package:flutter/material.dart';
import 'package:git_search/domain/models/git_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/domain/models/git_repository_response.dart';
import 'package:git_search/presentation/search_screen/use_case/fetch_git_repositories_use_case.dart';
import 'package:git_search/presentation/search_screen/use_case/get_saved_git_repos_use_case.dart';
import 'package:git_search/presentation/search_screen/use_case/toggle_favorites_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.fetchGitRepositoriesUseCase,
    required this.getSavedGitReposUseCase,
    required this.toggleFavoritesUsecase,
  }) : super(SearchInitial());

  final FetchGitRepositoriesUseCase fetchGitRepositoriesUseCase;
  final GetSavedGitReposUseCase getSavedGitReposUseCase;
  final ToggleFavoritesUsecase toggleFavoritesUsecase;

  static const int _itemsCount = 15;
  int page = 1;
  bool isLastPage = false;
  List<GitRepository> allGitRepos = <GitRepository>[];
  bool isFutureRunning = false;

  Future<void> getSavedGitRepos() async {
    try {
      List<GitRepository> savedRepos = await getSavedGitReposUseCase.call();
      emit(HistoryLoaded(gitRepositories: savedRepos));
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
    } catch (e) {
      print(e);
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
    } catch (e) {
      print(e);
    } finally {
      isFutureRunning = false;
    }
  }

  Future<void> toggleFavorite(GitRepository gitRepository) async {
    try {
      GitRepository changedGitRepository =
          await toggleFavoritesUsecase.call(gitRepository);

      final index = allGitRepos.indexWhere((element) => element.id == gitRepository.id);
      allGitRepos[index] = changedGitRepository;
      emit(
        SearchLoaded(gitRepositories: allGitRepos, isLastPage: isLastPage),
      );
    } catch (e) {
      print(e);
    }
  }
}
