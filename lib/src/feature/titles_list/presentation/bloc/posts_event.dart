part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPosts extends PostsEvent {}

class RefreshPosts extends PostsEvent {}

class SearchPosts extends PostsEvent {
  final String query;
  SearchPosts(this.query);

  @override
  List<Object?> get props => [query];
}
