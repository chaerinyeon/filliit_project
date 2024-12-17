// lib/ui/pages/community/commu_tabs/widgets/community_post_list.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/data/model/community_post.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_detail/community_post_detail_page.dart';
import 'package:flutter_fillit_app/ui/pages/community/community_post_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityPostList extends ConsumerWidget {
  final String category;
  final List<CommunityPost> posts;

  const CommunityPostList({
    Key? key,
    required this.category,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ViewModel의 Notifier 인스턴스 가져오기
    final postViewModel = ref.read(postViewModelProvider.notifier);

    if (posts.isEmpty) {
      return Center(
        child: Text(
          '해당 카테고리에 게시글이 없습니다.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    const Color.fromARGB(255, 137, 139, 142), // 원하는 색상으로 변경
                child: Text(
                  post.title.isNotEmpty ? post.title[0] : '',
                  style: TextStyle(color: Colors.white),
                  semanticsLabel: '${post.title}의 첫 글자',
                ),
              ),
              title: Text(post.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.writer),
                  SizedBox(height: 4),
                  Text(
                    post.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  SizedBox(height: 4),
                  Text('클릭수: ${post.clickCount}'),
                ],
              ),
              onTap: () async {
                try {
                  await postViewModel.incrementClickCount(post.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${post.writer} 클릭됨')),
                  );
                  // 상세보기 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostDetailPage(post: post),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('클릭 수 증가에 실패했습니다.')),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
