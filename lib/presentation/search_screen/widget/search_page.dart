import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_search/consts/app_colors.dart';
import 'package:git_search/consts/app_strings.dart';
import 'package:git_search/consts/image_assets.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/presentation/search_screen/bloc/search_cubit.dart';
import 'package:git_search/presentation/search_screen/use_case/fetch_git_repositories_use_case.dart';
import 'package:git_search/presentation/search_screen/widget/search_result_list.dart';
import 'package:git_search/presentation/search_screen/widget/search_text_field.dart';
import 'package:git_search/utils/debouncer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final inputController = TextEditingController();

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
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchTextField(
                  inputController: inputController,
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (BuildContext context, SearchState state) {
                      if (state is SearchLoaded) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.whatHaveFound,
                              style: const TextStyle(
                                color: AppColors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: SearchResultList(
                                gitRepos: state.gitRepositories,
                                isLastPage: state.isLastPage,
                                onFinishingScroll: () => context
                                    .read<SearchCubit>()
                                    .fetchGitRepositories(inputController.text),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
