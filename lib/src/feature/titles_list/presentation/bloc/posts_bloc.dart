import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_app_test/src/feature/titles_list/domain/entity/post_entity.dart';
import 'package:user_app_test/src/feature/titles_list/domain/usecase/get_posts_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUsecase getPosts;

  PostsBloc({required this.getPosts}) : super(PostsInitial()) {
    on<LoadPosts>(_onLoadPosts);
    on<SearchPosts>(_onSearchPosts);
    on<RefreshPosts>(_onRefreshPosts);
  }

  Future<void> _onLoadPosts(LoadPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try {
      final posts = await getPosts();
      emit(PostsLoaded(posts: posts, filteredPosts: posts));
    } catch (e) {
      emit(PostsError(message: e.toString()));
    }
  }

  void _onSearchPosts(SearchPosts event, Emitter<PostsState> emit) {
    if (state is PostsLoaded) {
      final current = state as PostsLoaded;
      final filtered = current.posts
          .where(
            (p) => p.title.toLowerCase().contains(event.query.toLowerCase()),
          )
          .toList();
      emit(current.copyWith(filteredPosts: filtered));
    }
  }

  Future<void> _onRefreshPosts(
    RefreshPosts event,
    Emitter<PostsState> emit,
  ) async {
    try {
      final posts = await getPosts();
      emit(PostsLoaded(posts: posts, filteredPosts: posts));
    } catch (e) {
      emit(PostsError(message: e.toString()));
    }
  }
}
