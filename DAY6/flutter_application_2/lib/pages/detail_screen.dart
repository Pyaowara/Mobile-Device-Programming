import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/app_loading.dart';
import '../services/post_api.dart';
import '../models/post.dart';
import '../widgets/detailed.dart';

class DetailScreen extends StatefulWidget {
  final int postId;

  const DetailScreen({super.key, required this.postId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<Post> _postFuture;

  @override
  void initState() {
    super.initState();
    _postFuture = PostApi.fetchPostById(widget.postId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Detail')),
      body: FutureBuilder<Post>(
        future: _postFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final post = snapshot.data!;
            return Detailed(post: post);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return AppLoading();
          }
        },
      ),
    );
  }
}