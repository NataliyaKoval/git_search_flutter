import 'package:flutter/material.dart';
import 'package:git_search/domain/models/git_repository.dart';

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
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.gitRepos.length,
      itemBuilder: (context, index) =>
          SizedBox(height: 50,child: Text(widget.gitRepos[index].login)),
    );
  }
}
