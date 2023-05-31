import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/presentation/search_screen/bloc/search_cubit.dart';
import 'package:git_search/presentation/search_screen/use_case/fetch_git_repositories_use_case.dart';
import 'package:git_search/utils/debouncer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final inputController = TextEditingController();
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (BuildContext context) => SearchCubit(
        fetchGitRepositoriesUseCase: FetchGitRepositoriesUseCase(
          repository: context.read<Repository>(),
        ),
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: inputController,
                    onChanged: (value) => _onInputChanged(context, value),
                  ),
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
      ),
    );
  }

  void _onInputChanged (BuildContext context, String value) {
    debouncer.run(() {
      context.read<SearchCubit>().fetchGitRepositories(query: value);
    });
  }
}
