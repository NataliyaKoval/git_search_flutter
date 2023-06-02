import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_search/consts/app_colors.dart';
import 'package:git_search/consts/app_strings.dart';
import 'package:git_search/consts/image_assets.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/presentation/favorite_screen/bloc/favorite_cubit.dart';
import 'package:git_search/presentation/favorite_screen/use_case/get_favorites_use_case.dart';
import 'package:git_search/presentation/widgets/git_repo_list_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteCubit>(
      create: (context) => FavoriteCubit(
        getFavoritesUseCase: GetFavoritesUseCase(
          repository: context.read<Repository>(),
        ),
      )..getFavorites(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 44,
          backgroundColor: AppColors.ghostWhite,
          centerTitle: true,
          title: Text(
            AppStrings.favoriteScreenTitle,
            style: const TextStyle(color: AppColors.blackChocolate),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Ink(
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: SvgPicture.asset(
                  ImageAssets.arrow,
                  color: AppColors.ghostWhite,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoaded) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: state.gitRepos.length,
                  itemBuilder: (context, index) => GitRepoListItem(
                    gitRepository: state.gitRepos[index],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}