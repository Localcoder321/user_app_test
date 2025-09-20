import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:user_app_test/src/feature/titles_list/data/models/post_model.dart';

abstract class PostRemoteDatasource {
  Future<List<PostModel>> getPosts();
}

class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final Dio client;

  PostRemoteDatasourceImpl({required this.client});

  factory PostRemoteDatasourceImpl.create() {
    final dio = Dio(
      BaseOptions(
        headers: {"Accept": "application/json", "User-Agent": "Flutter-App"},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log("Request [${options.method}] => path: ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log(
            "Response [${response.statusCode}] => path ${response.requestOptions.uri}",
          );
          return handler.next(response);
        },
        onError: (error, handler) {
          log(
            'Error [${error.response?.statusCode}] => path ${error.requestOptions.uri}',
          );
          log('Error message: ${error.message}');
          return handler.next(error);
        },
      ),
    );
    return PostRemoteDatasourceImpl(client: dio);
  }

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await client.get(
      "https://jsonplaceholder.typicode.com/posts",
    );
    final List<dynamic> data = response.data;
    return data.map((result) => PostModel.fromMap(result)).toList();
  }
}
