import 'package:flutter/material.dart';
import 'package:git_search/domain/models/git_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/domain/models/git_repository_response.dart';
import 'package:git_search/presentation/search_screen/use_case/fetch_git_repositories_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.fetchGitRepositoriesUseCase})
      : super(SearchInitial());

  final FetchGitRepositoriesUseCase fetchGitRepositoriesUseCase;

  Future<void> fetchGitRepositories(String query, int itemsCount) async {
    GitRepositoryResponse response = await fetchGitRepositoriesUseCase
        .call(GitRepoParams(query: query, itemsCount: itemsCount));
    print(response.totalCount);
    print(response.items.length);
  }
}
