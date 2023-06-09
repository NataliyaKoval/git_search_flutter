import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_search/consts/app_colors.dart';
import 'package:git_search/consts/app_strings.dart';
import 'package:git_search/consts/image_assets.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/presentation/favorite_screen/widget/favorite_page.dart';
import 'package:git_search/presentation/search_screen/bloc/search_cubit.dart';
import 'package:git_search/presentation/search_screen/use_case/fetch_git_repositories_use_case.dart';
import 'package:git_search/presentation/search_screen/use_case/get_saved_queries_use_case.dart';
import 'package:git_search/presentation/search_screen/use_case/save_query_use_case.dart';
import 'package:git_search/presentation/search_screen/use_case/toggle_favorites_use_case.dart';
import 'package:git_search/presentation/search_screen/widget/search_result_list.dart';
import 'package:git_search/presentation/search_screen/widget/search_text_field.dart';
import 'package:git_search/presentation/use_cases/get_favorites_use_case.dart';
import 'package:git_search/presentation/widgets/empty_list_text.dart';

import 'history_loaded_container.dart';

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
        saveQueryUseCase: SaveQueryUseCase(
          repository: context.read<Repository>(),
        ),
        toggleFavoritesUsecase: ToggleFavoritesUsecase(
          repository: context.read<Repository>(),
        ),
        getSavedQueriesUseCase: GetSavedQueriesUseCase(
          repository: context.read<Repository>(),
        ),
        getFavoritesUseCase: GetFavoritesUseCase(
          repository: context.read<Repository>(),
        ),
      )..getQueriesHistory(),
      child: Builder(builder: (context) {
        return BlocListener<SearchCubit, SearchState>(
          listener: (context, state) {
            if (state is SearchError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: Scaffold(
            appBar: _buildAppBar(context),
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
                      builder: (context, state) =>
                          _buildScreenBody(context, state),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 44,
      backgroundColor: AppColors.ghostWhite,
      centerTitle: true,
      title: Text(
        AppStrings.searchScreenTitle,
        style: const TextStyle(color: AppColors.blackChocolate),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 11),
          child: Ink(
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () => _awaitReturnValueFromFavoriteScreen(context),
              icon: SvgPicture.asset(
                ImageAssets.star,
                color: AppColors.ghostWhite,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildScreenBody(BuildContext context, SearchState state) {
    if (state is HistoryLoaded) {
      return HistoryLoadedContainer(
        historyItems: state.historyItems,
      );
    } else if (state is HistoryEmpty) {
      return Center(
        child: EmptyListText(
          text: AppStrings.noHistory,
        ),
      );
    } else if (state is SearchLoaded) {
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
                  .fetchNextGitRepositories(inputController.text),
            ),
          ),
        ],
      );
    } else if (state is SearchLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Container();
    }
  }

  void _awaitReturnValueFromFavoriteScreen(BuildContext context) async {
    if (!context.mounted) return;
    final List<int> result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FavoritePage(),
        ));
    if (result.isNotEmpty) {
      context.read<SearchCubit>().updateListAfterRemovingFavorites(result);
    }
  }
}
