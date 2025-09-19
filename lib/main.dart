import 'package:flutter/material.dart';
import 'package:user_app_test/app.dart';
import 'package:user_app_test/src/feature/titles_list/data/remote_datasource/post_remote_datasource.dart';
import 'package:user_app_test/src/feature/titles_list/data/repository/post_repository_impl.dart';
import 'package:user_app_test/src/feature/titles_list/domain/usecase/get_posts_usecase.dart';

void main() {
  final remoteDatasource = PostRemoteDatasourceImpl.create();
  final repository = PostRepositoryImpl(remoteDatasource: remoteDatasource);
  final getPosts = GetPostsUsecase(repository: repository);
  runApp(MyApp(getPosts: getPosts));
}
