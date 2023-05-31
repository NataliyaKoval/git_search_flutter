part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoaded extends SearchState {
  SearchLoaded({
    required this.gitRepositories,
  });

  final List<GitRepository> gitRepositories;
}
