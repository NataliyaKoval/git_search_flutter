import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/domain/use_case/use_case.dart';

class GetSavedQueriesUseCase extends NoParamsUseCase<Set<String>> {
  GetSavedQueriesUseCase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<Set<String>> call() async {
    return repository.getSavedQueries();
  }
}
