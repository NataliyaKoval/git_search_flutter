import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:git_search/consts/app_colors.dart';
import 'package:git_search/consts/image_assets.dart';
import 'package:git_search/presentation/search_screen/bloc/search_cubit.dart';
import 'package:git_search/utils/debouncer.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  final TextEditingController inputController;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.inputController,
      decoration: InputDecoration(
        //filled: true,
        fillColor: AppColors.lavender,
        contentPadding: const EdgeInsets.all(18),
        prefixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 14,
          ),
          child: SvgPicture.asset(
            ImageAssets.search,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.blue,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 20,
          minWidth: 20,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 18),
          child: IconButton(
            onPressed: () => widget.inputController.clear(),
            icon: SvgPicture.asset(
              ImageAssets.close,
            ),
          ),
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(color: AppColors.argent),
      ),
      onChanged: (value) => _onInputChanged(context, value),
    );
  }

  void _onInputChanged(BuildContext context, String value) {
     debouncer.run(() {
      context.read<SearchCubit>().searchGitRepositories(value);
     });
  }
}
