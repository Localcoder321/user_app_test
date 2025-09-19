import 'package:dio/dio.dart';
import 'package:user_app_test/src/feature/titles_list/data/models/post_model.dart';

class PostRemoteDatasource {
  final Dio dio;
  PostRemoteDatasource({Dio? dio}) : dio = dio ?? Dio();

  Future<List<PostModel>> fetchPosts() async {
    final url = "https://jsonplaceholder.typicode.com/posts";
    try {
      final res = await dio.get(url);
      if (res.statusCode == 200) {
        final List data = res.data as List;
        return data
            .map((e) => PostModel.fromMap(e as Map<String, Object?>))
            .toList();
      } else {
        throw Exception("Failed to load posts, status code ${res.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error ${e.message}");
    }
  }
}
