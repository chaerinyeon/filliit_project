import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/model/community_post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommunityPosts extends StatefulWidget {
  final List<CommunityPost> allPosts; // 전체 포스트 데이터를 받아옴

  const CommunityPosts({Key? key, required this.allPosts}) : super(key: key);

  @override
  _CommunityPostsState createState() => _CommunityPostsState();
}

class _CommunityPostsState extends State<CommunityPosts> {
  late List<CommunityPost> _popularPosts; // 클릭 수 기준으로 정렬된 인기 게시글

  @override
  void initState() {
    super.initState();
    _popularPosts = List.from(widget.allPosts); // 전체 포스트 복사
    _loadClickCounts();
  }

  // 클릭 수를 SharedPreferences에서 로드
  Future<void> _loadClickCounts() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _popularPosts.forEach((post) {
        post.clickCount = prefs.getInt(post.name) ?? 0;
      });
      _popularPosts.sort((a, b) => b.clickCount.compareTo(a.clickCount));
    });
  }

  // 클릭 수를 SharedPreferences에 저장
  Future<void> _saveClickCount(String postName, int count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(postName, count);
  }

  @override
  Widget build(BuildContext context) {
    if (_popularPosts.isEmpty) {
      return Center(
        child: Text(
          '인기 커뮤니티 글이 없습니다.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return Column(
      children: [
        Container(
          height: 100, // 원하는 높이로 조절하세요
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.vertical, // 세로 스크롤
            itemCount: _popularPosts.length,
            itemBuilder: (context, index) {
              final post = _popularPosts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
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
                        _popularPosts.sort(
                            (a, b) => b.clickCount.compareTo(a.clickCount));
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${post.name} 클릭됨')),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
