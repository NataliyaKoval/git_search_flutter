import 'package:git_search/data/entity/git_repository_entity.dart';
import 'package:hive/hive.dart';

class LocalDatabase {
  final Box<GitRepositoryEntity> searchedBox =
      Hive.box<GitRepositoryEntity>('searched');

  void saveSearchedGitRepos(GitRepositoryEntity gitRepo) {
    searchedBox.add(gitRepo);
  }

  List<GitRepositoryEntity> getSavedGitRepos() {
    return searchedBox.values.toList();
  }
}
