import 'package:user_app_test/src/feature/titles_list/data/remote_datasource/post_remote_datasource.dart';
import 'package:user_app_test/src/feature/titles_list/domain/entity/post_entity.dart';
import 'package:user_app_test/src/feature/titles_list/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource remoteDatasource;
  PostRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<PostEntity>> getPosts() async {
    final models = await remoteDatasource.getPosts();
    return models;
  }
}
