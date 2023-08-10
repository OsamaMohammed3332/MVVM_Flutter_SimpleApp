import 'package:flutter/material.dart';
import 'package:mvvm/repositories/posts_api.dart';
import 'package:mvvm/view_model/post_view_model.dart';
import 'package:mvvm/view_model/posts_view_model.dart';

class PostsView extends StatelessWidget {
  PostsView({super.key});
  final postsViewModel = PostsViewModel(postsRepo: PostsApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
          child: FutureBuilder<List<PostViewModel>>(
        future: postsViewModel.fetchAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            var posts = snapshot.data;
            return ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(posts?[index].title),
              ),
            );
          }
        },
      )),
    );
  }
}
