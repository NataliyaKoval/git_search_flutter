import 'package:git_search/data/entity/git_repository_entity.dart';
import 'package:hive/hive.dart';

class LocalDatabase {
  final Box<String> queriesBox = Hive.box<String>('queries');
  final Box<GitRepositoryEntity> favorites =
      Hive.box<GitRepositoryEntity>('favorites');

  void saveQuery(String query) {
    queriesBox.put(query, query);
  }

  List<String> getSavedQueries() {
    return queriesBox.values.toList();
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
