// lib/ui/widgets/popular_posts.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/data/model/community_post.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_tabs/all_commu_tabs.dart';
import 'package:flutter_fillit_app/ui/pages/community/community_post_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularPosts extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postViewModel = ref.watch(postViewModelProvider);
    final postRepository = ref.watch(postRepositoryProvider);

    // 상위 5개의 게시글 가져오기 (클릭 수 기준 내림차순 정렬)
    final topFivePosts = List<CommunityPost>.from(postViewModel)
      ..sort((a, b) => b.clickCount.compareTo(a.clickCount));
    final topPosts = topFivePosts.take(5).toList();

    if (topPosts.isEmpty) {
      return Container(); // 인기 게시글이 없을 때는 빈 공간
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 인기 게시글 타이틀
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '인기 커뮤니티 글',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        // 인기 게시글 리스트
        Container(
          height: 300, // 원하는 높이로 조절하세요
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // 가로 스크롤
            itemCount: topPosts.length,
            itemBuilder: (context, index) {
              final post = topPosts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: GestureDetector(
                  onTap: () async {
                    try {
                      await postRepository.incrementClickCount(post.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${post.writer} 클릭됨')),
                      );
                      // 상세보기 페이지로 이동 (선택 사항)
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
                  child: CommunityPostItem(
                    post: post,
                    avatarColor: _getCategoryColor(post.category),
                    onTap: () {}, // 이미 onTap에서 처리하므로 비워둡니다.
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // 카테고리별 색상 설정 함수
  Color _getCategoryColor(String category) {
    switch (category) {
      case '정보공유':
        return Colors.blueAccent;
      case 'QnA':
        return Colors.greenAccent;
      case '자유게시판':
        return Colors.orangeAccent;
      case '전체':
      default:
        return Colors.purpleAccent;
    }
  }
}
