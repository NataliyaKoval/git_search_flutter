import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/domain/models/git_repository.dart';
import 'package:git_search/presentation/search_screen/bloc/search_cubit.dart';
import 'package:git_search/presentation/widgets/git_repo_list_item.dart';

class SearchResultList extends StatefulWidget {
  const SearchResultList({
    Key? key,
    required this.gitRepos,
    required this.isLastPage,
    required this.onFinishingScroll,
  }) : super(key: key);

  final List<GitRepository> gitRepos;
  final bool isLastPage;
  final VoidCallback onFinishingScroll;

  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 200 &&
          !widget.isLastPage) {
        widget.onFinishingScroll();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      separatorBuilder: (context, index) => const SizedBox(height: 8,),
      itemCount: widget.gitRepos.length,
      itemBuilder: (context, index) =>
          GitRepoListItem(
            gitRepository: widget.gitRepos[index], onPressed: () {
            context.read<SearchCubit>().toggleFavorite(widget.gitRepos[index]);
          },
          ),
    );
  }
}
