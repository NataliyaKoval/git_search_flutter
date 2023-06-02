import 'package:git_search/data/entity/git_repository_entity.dart';
import 'package:hive/hive.dart';

class LocalDatabase {
  final Box<GitRepositoryEntity> searchedBox =
      Hive.box<GitRepositoryEntity>('searched');
  final Box<GitRepositoryEntity> favorites =
      Hive.box<GitRepositoryEntity>('favorites');

  void saveSearchedGitRepos(GitRepositoryEntity gitRepo) {
    searchedBox.add(gitRepo);
  }

  List<GitRepositoryEntity> getSavedGitRepos() {
    return searchedBox.values.toList();
  }

  void addToFavorites(GitRepositoryEntity gitRepo) {
    favorites.put(gitRepo.id, gitRepo);
  }

  void removeFromFavorites(int key) {
    favorites.delete(key);
  }

  List<GitRepositoryEntity> getFavorites() {
    return favorites.values.toList();
  }

  List<dynamic> getFavoritesKeys() {
    final List<dynamic> keys = favorites.keys.toList();
    return keys;
  }
}
