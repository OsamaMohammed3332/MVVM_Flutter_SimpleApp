import 'package:flutter/material.dart';
import 'package:mvvm/view/posts/posts_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostsView(),
    );
  }
}
