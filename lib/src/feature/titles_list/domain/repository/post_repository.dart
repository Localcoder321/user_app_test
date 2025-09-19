import 'package:user_app_test/src/feature/titles_list/domain/entity/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getPosts();
}
