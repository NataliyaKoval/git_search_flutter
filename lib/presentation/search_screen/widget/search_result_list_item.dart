import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_search/consts/app_colors.dart';
import 'package:git_search/consts/image_assets.dart';

class SearchResultListItem extends StatelessWidget {
  const SearchResultListItem({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 18,
        bottom: 17,
        right: 10,
      ),
      color: AppColors.antiFlashWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              ImageAssets.star,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
