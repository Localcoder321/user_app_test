part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<PostEntity> posts;
  final List<PostEntity> filteredPosts;
  PostsLoaded({required this.posts, required this.filteredPosts});

  PostsLoaded copyWith({
    List<PostEntity>? posts,
    List<PostEntity>? filteredPosts,
  }) {
    return PostsLoaded(
      posts: posts ?? this.posts,
      filteredPosts: filteredPosts ?? this.filteredPosts,
    );
  }

  @override
  List<Object?> get props => [posts, filteredPosts];
}

class PostsError extends PostsState {
  final String message;
  PostsError({required this.message});

  @override
  List<Object?> get props => [message];
}
