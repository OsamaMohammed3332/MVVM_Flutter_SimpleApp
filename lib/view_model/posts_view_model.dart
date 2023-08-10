import 'package:mvvm/models/post_model.dart';
import 'package:mvvm/repositories/post_repo.dart';
import 'package:mvvm/view_model/post_view_model.dart';

class PostsViewModel {
  final String title = "All Posts";
  PostsRepo? postsRepo;

  PostsViewModel({this.postsRepo});

  Future<List<PostViewModel>> fetchAllPosts() async {
    List<PostModel> list = await postsRepo!.getAllPosts();
    return list.map((post) => PostViewModel(postModel: post)).toList();
  }
}
