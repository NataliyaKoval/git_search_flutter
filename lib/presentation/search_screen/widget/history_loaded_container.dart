import 'package:flutter/material.dart';
import 'package:git_search/consts/app_colors.dart';
import 'package:git_search/consts/app_strings.dart';
import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/presentation/search_screen/widget/history_list.dart';

class HistoryLoadedContainer extends StatelessWidget {
  const HistoryLoadedContainer({
    Key? key,
    required this.gitRepositories,
  }) : super(key: key);

  final List<GitRepository> gitRepositories;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.searchHistory,
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
          child: HistoryList(
            gitRepositories: gitRepositories,
          ),
        ),
      ],
    );
    ;
  }
}
