part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  SearchLoaded({
    required this.gitRepositories,
    required this.isLastPage,
  });

  final List<GitRepository> gitRepositories;
  final bool isLastPage;
}
