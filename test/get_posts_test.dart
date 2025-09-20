import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_app_test/src/feature/titles_list/domain/entity/post_entity.dart';
import 'package:user_app_test/src/feature/titles_list/domain/repository/post_repository.dart';
import 'package:user_app_test/src/feature/titles_list/domain/usecase/get_posts_usecase.dart';

class MockRepository extends Mock implements PostRepository {}

void main() {
  late MockRepository repository;
  late GetPostsUsecase getPosts;

  setUp(() {
    repository = MockRepository();
    getPosts = GetPostsUsecase(repository: repository);
  });

  final testPosts = [
    PostEntity(userId: 1, id: 12, title: "title", body: "body"),
    PostEntity(userId: 4, id: 31, title: "Nothing", body: "Expression"),
  ];

  test("Successful result", () async {
    when(
      () => repository.getPosts(),
    ).thenAnswer((_) async => testPosts);

    final result = await getPosts();

    expect(result, equals(testPosts));
    verify(() => repository.getPosts()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test("Throw exception", () async {
    when(
      () => repository.getPosts(),
    ).thenThrow(Exception("Failed to fetch data"));

    expect(() async => await getPosts(), throwsException);
    verify(() => repository.getPosts()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
