part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  FavoriteLoaded({
    required this.gitRepos,
  });

  final List<GitRepository> gitRepos;
}
