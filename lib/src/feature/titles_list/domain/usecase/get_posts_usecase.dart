import 'package:user_app_test/src/feature/titles_list/domain/entity/post_entity.dart';
import 'package:user_app_test/src/feature/titles_list/domain/repository/post_repository.dart';

class GetPostsUsecase {
  final PostRepository repository;
  GetPostsUsecase({required this.repository});

  Future<List<PostEntity>> call() async {
    return repository.getPosts();
  }
}
