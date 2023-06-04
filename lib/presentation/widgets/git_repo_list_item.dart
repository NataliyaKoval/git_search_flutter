import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_search/consts/app_colors.dart';
import 'package:git_search/consts/image_assets.dart';
import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/presentation/search_screen/bloc/search_cubit.dart';

class GitRepoListItem extends StatelessWidget {
  const GitRepoListItem({
    Key? key,
    required this.gitRepository,
    required this.onPressed,
  }) : super(key: key);

  final GitRepository gitRepository;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 10,
      ),
      height: 55,
      color: AppColors.antiFlashWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(gitRepository.login),
          IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              ImageAssets.star,
              color:
                  gitRepository.isFavorite ? AppColors.blue : AppColors.argent,
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
