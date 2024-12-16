import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/model/community_post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 카테고리별 게시글
  final Map<String, List<CommunityPost>> _postsByCategory = {
    '전체': [],
    '정보공유': [],
    'QnA': [],
    '자유게시판': [],
  };

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _postsByCategory.keys.length, vsync: this);
    _initializePosts();
  }

  // 초기 게시글 데이터를 설정
  void _initializePosts() {
    final initialPosts = {
      '정보공유': [
        CommunityPost(name: '정보 공유 글 1', artist: '작성자 A'),
        CommunityPost(name: '정보 공유 글 2', artist: '작성자 B'),
      ],
      'QnA': [
        CommunityPost(name: 'QnA 질문 1', artist: '작성자 C'),
        CommunityPost(name: 'QnA 질문 2', artist: '작성자 D'),
      ],
      '자유게시판': [
        CommunityPost(name: '자유 글 1', artist: '작성자 E'),
        CommunityPost(name: '자유 글 2', artist: '작성자 F'),
      ],
    };

    // 각 카테고리 게시글을 전체 탭에도 등록
    initialPosts.forEach((category, posts) {
      _postsByCategory[category] = posts;
      _postsByCategory['전체']!.addAll(posts);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // 게시글 리스트를 출력하는 위젯
  Widget _buildPostList(String category) {
    final posts = _postsByCategory[category]!;
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 1,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  post.name.isNotEmpty ? post.name[0] : '',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(post.name),
              subtitle: Text(post.artist),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_forward_ios),
                  const SizedBox(height: 4),
                  Text('클릭수: ${post.clickCount}'),
                ],
              ),
              onTap: () {
                setState(() {
                  post.clickCount += 1;
                  _saveClickCount(post.name, post.clickCount);
                  _postsByCategory['전체']!
                      .sort((a, b) => b.clickCount.compareTo(a.clickCount));
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${post.name} 클릭됨')),
                );
              },
            ),
          ),
        );
      },
    );
  }

  // 클릭 수 저장
  Future<void> _saveClickCount(String postName, int count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(postName, count);
  }

  @override
  Widget build(BuildContext context) {
    final tabTitles = _postsByCategory.keys.toList();

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
      body: TabBarView(
        controller: _tabController,
        children:
            tabTitles.map((category) => _buildPostList(category)).toList(),
      ),
    );
  }
}
