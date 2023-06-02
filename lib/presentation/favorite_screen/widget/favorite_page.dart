import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:git_search/presentation/favorite_screen/bloc/favorite_cubit.dart';
import 'package:git_search/presentation/favorite_screen/use_case/get_favorites_use_case.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoaded) {
              return ListView.builder(
                itemCount: state.gitRepos.length,
                itemBuilder: (context, index) =>
                    Text(state.gitRepos[index].login),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
