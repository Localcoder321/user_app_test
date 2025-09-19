import 'package:flutter/material.dart';
import 'package:user_app_test/src/feature/titles_list/domain/usecase/get_posts_usecase.dart';
import 'package:user_app_test/src/feature/titles_list/presentation/pages/posts_list_page.dart';

class MyApp extends StatelessWidget {
  final GetPostsUsecase getPosts;
  const MyApp({super.key, required this.getPosts});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const PostsListPage(),
    );
  }
}
