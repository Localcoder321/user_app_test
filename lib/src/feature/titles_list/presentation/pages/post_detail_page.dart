import 'package:flutter/material.dart';
import 'package:user_app_test/src/feature/titles_list/domain/entity/post_entity.dart';

class PostDetailPage extends StatelessWidget {
  final PostEntity post;
  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: ${post.id}"),
            const SizedBox(height: 8),
            Text("User ID: ${post.userId}"),
            const SizedBox(height: 8),
            Text("Title: ${post.title}"),
            const SizedBox(height: 8),
            Text("Description: ${post.body}"),
          ],
        ),
      ),
    );
  }
}
