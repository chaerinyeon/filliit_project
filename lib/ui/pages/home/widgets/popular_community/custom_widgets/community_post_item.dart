// lib/ui/widgets/community_post_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/data/model/community_post.dart';

class CommunityPostItem extends StatelessWidget {
  final CommunityPost post;
  final VoidCallback? onTap;

  const CommunityPostItem({
    Key? key,
    required this.post,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text('카테고리: ${post.category}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.visibility, size: 16.0, color: Colors.grey),
          SizedBox(width: 4.0),
          Text(post.clickCount.toString()),
        ],
      ),
      onTap: onTap,
    );
  }
}
