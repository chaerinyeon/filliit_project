import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/data/model/community_post.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_tabs/widgets/community_post_list.dart';

class FreeBoardTab extends StatelessWidget {
  final List<CommunityPost> freeboardPosts = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CommunityPostList(
            posts: freeboardPosts,
            category: 'free',
          ),
        ),
      ],
    );
  }
}
