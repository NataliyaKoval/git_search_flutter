import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_search/consts/app_colors.dart';
import 'package:git_search/consts/image_assets.dart';
import 'package:git_search/domain/models/git_repository.dart';

class HistoryListItem extends StatelessWidget {
  const HistoryListItem({
    Key? key,
    required this.gitRepository,
  }) : super(key: key);

  final GitRepository gitRepository;

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
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(
              ImageAssets.star,
              color:
              gitRepository.isFavorite ? AppColors.blue : AppColors.argent,
            ),
          ),
        ],
      ),
    );
  }
}