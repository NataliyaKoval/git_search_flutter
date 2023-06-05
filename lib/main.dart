import 'package:flutter/material.dart';
import 'package:git_search/consts/app_strings.dart';
import 'package:git_search/data/entity/git_repository_entity.dart';
import 'package:git_search/di/providers.dart';
import 'package:git_search/presentation/splash_screen/widget/splash_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<GitRepositoryEntity>(GitRepositoryEntityAdapter());
  await Hive.openBox<String>('queries');
  await Hive.openBox<GitRepositoryEntity>('favorites');
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
        home: const SplashPage(),
      ),
    );
  }
}
