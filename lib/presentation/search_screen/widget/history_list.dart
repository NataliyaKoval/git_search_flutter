import 'package:flutter/material.dart';
import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/presentation/search_screen/widget/history_list_item.dart';
import 'package:git_search/presentation/widgets/git_repo_list_item.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    Key? key,
    required this.gitRepositories,
  }) : super(key: key);

  final List<GitRepository> gitRepositories;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemCount: gitRepositories.length,
      itemBuilder: (context, index) => HistoryListItem(
        gitRepository: gitRepositories[index],
      ),
    );
  }
}
