import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/model/community_post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommunityPostList extends StatefulWidget {
  final List<CommunityPost> posts;

  const CommunityPostList({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  _CommunityPostListState createState() => _CommunityPostListState();
}

class _CommunityPostListState extends State<CommunityPostList> {
  late List<CommunityPost> _posts;

  @override
  void initState() {
    super.initState();
    _posts = widget.posts;
    _loadClickCounts();
  }

  Future<void> _loadClickCounts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _posts.forEach((post) {
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

  void _sortPostsByClickCount() {
    _posts.sort((a, b) => b.clickCount.compareTo(a.clickCount));
  }

  @override
  Widget build(BuildContext context) {
    if (_posts.isEmpty) {
      return Center(
        child: Text(
          '커뮤니티 포스트가 없습니다.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
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
                  post.name.isNotEmpty ? post.name[0] : '',
                  style: const TextStyle(color: Colors.white),
                  semanticsLabel: '${post.name}의 첫 글자',
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
              onTap: () => _handlePostClick(post),
            ),
          ),
        );
      },
    );
  }
}
