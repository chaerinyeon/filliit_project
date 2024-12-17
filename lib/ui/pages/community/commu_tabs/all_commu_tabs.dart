// lib/ui/pages/community/commu_tabs/widgets/all_community_tabs.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/data/model/community_post.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_detail/community_post_detail_page.dart';
import 'package:flutter_fillit_app/ui/pages/community/community_post_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 재사용 가능한 게시글 항목 위젯
class CommunityPostItem extends StatelessWidget {
  final CommunityPost post;
  final VoidCallback onTap;

  const CommunityPostItem({
    Key? key,
    required this.post,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 1,
        child: ListTile(
          leading: CircleAvatar(
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
          onTap: onTap,
        ),
      ),
    );
  }
}

// AllCommunityTabs 위젯
class AllCommunityTabs extends ConsumerStatefulWidget {
  final Map<String, List<CommunityPost>> postsByCategory; // 카테고리별 게시글 데이터

  const AllCommunityTabs({
    Key? key,
    required this.postsByCategory,
  }) : super(key: key);

  @override
  _AllCommunityTabsState createState() => _AllCommunityTabsState();
}

class _AllCommunityTabsState extends ConsumerState<AllCommunityTabs> {
  late List<CommunityPost> _allPosts; // 모든 게시글을 하나의 리스트로 병합
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _mergeAllPosts();
  }

  // 모든 게시글을 하나의 리스트로 병합하고 최근 작성 순으로 정렬
  void _mergeAllPosts() {
    _allPosts = [];
    widget.postsByCategory.forEach((category, posts) {
      _allPosts.addAll(posts);
    });
    // 최근 작성 순으로 정렬 (createdAt 기준 내림차순)
    _allPosts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // 게시글 클릭 시 호출되는 함수
  Future<void> _handlePostClick(CommunityPost post) async {
    try {
      await ref
          .read(postViewModelProvider.notifier)
          .incrementClickCount(post.id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${post.writer} 클릭됨')),
      );
      setState(() {
        // 클릭 수 증가 후 리스트를 다시 정렬 (createdAt 유지)
        _allPosts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      });
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
  }

  @override
  Widget build(BuildContext context) {
    if (_allPosts.isEmpty) {
      return Center(
        child: Text(
          '전체 커뮤니티 게시글이 없습니다.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: _allPosts.length,
      itemBuilder: (context, index) {
        final post = _allPosts[index];
        return CommunityPostItem(
          post: post,
          onTap: () => _handlePostClick(post),
        );
      },
    );
  }
}
