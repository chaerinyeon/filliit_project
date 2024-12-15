import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/community_posts.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/editable_buttons_box.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/event_card_section.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/search_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fillit'),
        actions: [
          IconButton(
            onPressed: () {
              // 찾기 버튼 클릭 시 동작
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('찾기 버튼이 클릭되었습니다')),
              );
            },
            icon: const Icon(Icons.search_outlined),
          ),
          IconButton(
            onPressed: () {
              // 알람 버튼 클릭 시 동작
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('알람 버튼이 클릭되었습니다')),
              );
            },
            icon: Icon(MdiIcons.bellOutline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EventCardSection(),
            const SizedBox(height: 20),
            SearchBox(),
            const SizedBox(height: 20),
            EditableButtonsBox(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Row(
                children: [
                  const Text(
                    '인기 커뮤니티',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      // 인기커뮤니티 전체보기 버튼 클릭 시 동작
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('인기커뮤니티 전체보기 클릭됨')),
                      );
                    },
                    icon: Icon(MdiIcons.chevronRight),
                  ),
                ],
              ),
            ),
            CommunityPosts(),
          ],
        ),
      ),
    );
  }
}
