import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app_test/src/feature/titles_list/presentation/bloc/posts_bloc.dart';
import 'package:user_app_test/src/feature/titles_list/presentation/pages/post_detail_page.dart';

class PostsListPage extends StatefulWidget {
  const PostsListPage({super.key});

  @override
  State<PostsListPage> createState() => _PostsListPageState();
}

class _PostsListPageState extends State<PostsListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(LoadPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of posts"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                context.read<PostsBloc>().add(SearchPosts(value));
              },
              decoration: const InputDecoration(
                hintText: "Search by title...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostsLoaded) {
            return RefreshIndicator(
              child: ListView.builder(
                itemCount: state.filteredPosts.length,
                itemBuilder: (context, index) {
                  final post = state.filteredPosts[index];
                  return ListTile(
                    title: Text(post.title, style: TextStyle(fontSize: 14)),
                    subtitle: Text(
                      post.body,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PostDetailPage(post: post),
                        ),
                      );
                    },
                  );
                },
              ),
              onRefresh: () async {
                context.read<PostsBloc>().add(RefreshPosts());
              },
            );
          } else if (state is PostsError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
