part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class HistoryEmpty extends SearchState {}

class HistoryLoaded extends SearchState {
  HistoryLoaded({
    required this.historyItems,
  });

  final List<HistoryItem> historyItems;
}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  SearchLoaded({
    required this.gitRepositories,
    required this.isLastPage,
  });

  final List<GitRepository> gitRepositories;
  final bool isLastPage;
}

class SearchError extends SearchState {
  SearchError({
    required this.message,
  });

  final String message;
}
