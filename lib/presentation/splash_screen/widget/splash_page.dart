import 'dart:async';

import 'package:flutter/material.dart';
import 'package:git_search/consts/app_colors.dart';
import 'package:git_search/consts/app_strings.dart';
import 'package:git_search/presentation/search_screen/widget/search_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<Timer> _loadData() async {
    return Timer(const Duration(seconds: 5), _onDoneLoading);
  }

  _onDoneLoading() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.blue,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.splashText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.antiFlashWhite
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const CircularProgressIndicator(color: AppColors.antiFlashWhite),
          ],
        ),
      ),
    );
  }
}
