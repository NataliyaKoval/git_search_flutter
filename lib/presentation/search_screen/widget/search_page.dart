import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/presentation/search_screen/bloc/search_cubit.dart';
import 'package:git_search/presentation/search_screen/use_case/fetch_git_repositories_use_case.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (BuildContext context) => SearchCubit(
        fetchGitRepositoriesUseCase: FetchGitRepositoriesUseCase(
          repository: context.read<Repository>(),
        ),
      )..fetchGitRepositories('fox', 15),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (BuildContext context, SearchState state) {
                return Text('dfgfdg');
              },
            )
          ],
        ),
      ),
    );
  }
}
