// lib/ui/pages/community/commu_tabs/information_sharing_tab.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/data/model/community_post.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_tabs/widgets/community_post_list.dart';

class InformationSharingTab extends StatelessWidget {
  final List<CommunityPost> infoPosts = [
    // 추가적인 정보 공유 글
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CommunityPostList(
            posts: infoPosts,
            category: 'information',
          ),
        ),
      ],
    );
  }
}
