// lib/ui/pages/community_tabs/qna_tab.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/model/community_post.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_tabs/widgets/community_post_list.dart';

class QnATab extends StatelessWidget {
  final List<CommunityPost> qnaPosts = [
    CommunityPost(name: 'QnA 1', artist: '작성자 A'),
    CommunityPost(name: 'QnA 2', artist: '작성자 B'),
    // 추가적인 정보 공유 글
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CommunityPostList(
            posts: qnaPosts,
          ),
        ),
      ],
    );
  }
}
