import 'package:flutter/material.dart';

class CommunityPosts extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {'name': '커뮤니티 인기 글 1', 'artist': '작성자 1'},
    {'name': '커뮤니티 인기 글 2', 'artist': '작성자 2'},
    {'name': '커뮤니티 인기 글 3', 'artist': '작성자 3'},
    {'name': '커뮤니티 인기 글 4', 'artist': '작성자 4'},
    {'name': '커뮤니티 인기 글 5', 'artist': '작성자 5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // 원하는 높이로 조절하세요
      child: PageView.builder(
        scrollDirection: Axis.vertical, // 세로 스크롤
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purpleAccent,
                  child: Text(
                    post['name']![0],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(post['name']!),
                subtitle: Text(post['artist']!),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${post['name']} 클릭됨')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
