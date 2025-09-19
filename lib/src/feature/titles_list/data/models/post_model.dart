import 'package:user_app_test/src/feature/titles_list/domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) : super(userId: userId, id: id, title: title, body: body);

  Map<String, Object?> toMap() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }

  factory PostModel.fromMap(Map<String, Object?> result) {
    return PostModel(
      userId: result['userId'] as int,
      id: result['id'] as int,
      title: result['title'] as String,
      body: result['body'] as String,
    );
  }
}
