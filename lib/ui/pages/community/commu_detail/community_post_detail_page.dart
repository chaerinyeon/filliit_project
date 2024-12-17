// lib/ui/pages/community/commu_detail/community_post_detail_page.dart

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
            Text('작성자: ${post.writer}', style: TextStyle(fontSize: 16.0)),
            SizedBox(height: 8.0),
            Text(post.content, style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.visibility, size: 20.0, color: Colors.grey),
                SizedBox(width: 4.0),
                Text('${post.clickCount}'),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              '작성일: ${post.createdAt.toLocal()}',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
