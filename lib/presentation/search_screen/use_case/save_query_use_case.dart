import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/domain/use_case/use_case.dart';

class SaveQueryUseCase extends UseCase<void, String> {
  SaveQueryUseCase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<void> call(String params) async {
    repository.saveQuery(params);
  }
}
