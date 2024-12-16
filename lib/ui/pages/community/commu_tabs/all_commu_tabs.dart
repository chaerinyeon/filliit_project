import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/model/community_post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCommunityTabs extends StatefulWidget {
  final Map<String, List<CommunityPost>> postsByCategory; // 카테고리별 게시글 데이터

  const AllCommunityTabs({
    Key? key,
    required this.postsByCategory,
  }) : super(key: key);

  @override
  _AllCommunityTabsState createState() => _AllCommunityTabsState();
}

class _AllCommunityTabsState extends State<AllCommunityTabs> {
  late List<CommunityPost> _allPosts; // 모든 게시글을 하나의 리스트로 병합
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _allPosts =
        widget.postsByCategory.values.expand((list) => list).toList(); // 병합
    _loadClickCounts();
  }

  Future<void> _loadClickCounts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _allPosts.forEach((post) {
          post.clickCount = prefs.getInt(post.name) ?? 0;
        });
        _sortPostsByClickCount();
      });
    } catch (e) {
      print('Error loading click counts: $e');
    }
  }

  Future<void> _saveClickCount(String postName, int count) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(postName, count);
    } catch (e) {
      print('Error saving click count: $e');
    }
  }

  void _sortPostsByClickCount() {
    _allPosts.sort((a, b) => b.clickCount.compareTo(a.clickCount));
  }

  void _handlePostClick(CommunityPost post) {
    setState(() {
      post.clickCount += 1;
      _saveClickCount(post.name, post.clickCount);
      _sortPostsByClickCount();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${post.name} 클릭됨')),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                  semanticsLabel: '${post.name}의 첫 글자',
                ),
              ),
              title: Text(post.name),
              subtitle: Text('${post.artist}'), // 카테고리 추가
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_forward_ios),
                  const SizedBox(height: 4),
                  Text('클릭수: ${post.clickCount}'),
                ],
              ),
              onTap: () => _handlePostClick(post),
            ),
          ),
        );
      },
    );
  }
}