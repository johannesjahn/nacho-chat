import 'app.dart';

class PostService {
  PostService._();

  static final instance = PostService._();

  final appService = AppService.instance;

  getPosts() async {
    final posts = await appService.api.getPostApi().postControllerGetPosts();

    print(posts);
  }
}
