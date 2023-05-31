import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:git_search/data/datasources/rest_api_client.dart';
import 'package:git_search/data/repository/repository_impl.dart';
import 'package:git_search/domain/repository/repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  List<SingleChildWidget> get providers => <SingleChildWidget>[
        Provider<Dio>(
          create: (BuildContext context) => Dio(),
        ),
        Provider<RestApiClient>(
          create: (BuildContext context) => RestApiClient(
            context.read<Dio>(),
          ),
        ),
        Provider<Repository>(
          create: (BuildContext context) =>
              RepositoryImpl(restApiClient: context.read<RestApiClient>()),
        ),
      ];
}
