// lib/ui/pages/community/post_detail_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/data/model/community_post.dart';

class PostDetailPage extends StatelessWidget {
  final CommunityPost post;

  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('작성자: ${post.writer}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(post.content, style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),
            Text('클릭수: ${post.clickCount}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}
