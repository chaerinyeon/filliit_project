// lib/ui/pages/community/community_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_tabs/widgets/community_post_list.dart';
import 'package:flutter_fillit_app/ui/pages/community/community_post_view_model.dart';
import 'package:flutter_fillit_app/ui/pages/community/create_post/create_post_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityPage extends ConsumerStatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends ConsumerState<CommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabCategories = ['전체', '정보공유', 'QnA', '자유게시판'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabCategories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabTitles = _tabCategories;
    final allPosts = ref.watch(postViewModelProvider); // 모든 게시글을 가져옴
    final isLoading = allPosts.isEmpty; // 간단한 로딩 상태 예시

    return Scaffold(
      appBar: AppBar(
        title: Text('커뮤니티 페이지'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: tabTitles.map((title) => Tab(text: title)).toList(),
          indicatorColor: const Color.fromARGB(255, 139, 62, 255),
          labelColor: const Color.fromARGB(255, 139, 62, 255),
          unselectedLabelColor: const Color.fromARGB(179, 91, 90, 90),
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // 인기 게시글 섹션

                // 탭별 게시글 리스트
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: _tabCategories.map((category) {
                      // 카테고리에 해당하는 게시글 필터링
                      final posts = ref
                          .read(postViewModelProvider.notifier)
                          .getPostsByCategory(category);
                      return CommunityPostList(
                        category: category,
                        posts: posts,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          // CreateCommunityPostPage로 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CreateCommunityPostPage()),
          );
        },
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
