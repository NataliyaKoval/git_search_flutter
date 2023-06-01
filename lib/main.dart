import 'package:flutter/material.dart';
import 'package:git_search/consts/app_strings.dart';
import 'package:git_search/di/providers.dart';
import 'package:git_search/presentation/search_screen/widget/search_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Providers providers;

  @override
  void initState() {
    super.initState();
    providers = Providers();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers.providers,
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SearchPage(),
      ),
    );
  }
}
