import 'package:dio/dio.dart';
import 'package:mvvm/models/post_model.dart';
import 'package:mvvm/repositories/post_repo.dart';

class PostsApi extends PostsRepo {
  @override
  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> posts = [];
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      List list = response.data;
      posts = list.map((post) => PostModel.fromJson(post)).toList();
    } catch (e) {
      print(e);
    }
    print(posts);
    return posts;
  }
}
