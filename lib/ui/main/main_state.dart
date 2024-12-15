// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/category_page.dart';
import 'package:flutter_fillit_app/ui/pages/community/community_page.dart';
import 'package:flutter_fillit_app/ui/pages/home/home_page.dart';
import 'package:flutter_fillit_app/ui/pages/my/my_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainPage extends StatefulWidget {
  // MainPage는 하단 네비게이션 바를 관리하는 StatefulWidget입니다.
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1; // 초기 탭을 '홈페이지'로 설정

  // 탭에 해당하는 페이지 리스트
  final List<Widget> _pages = [
    CategoryPage(),
    HomePage(),
    MyPage(),
    CommunityPage(),
  ];

  // 네비게이션 아이콘과 라벨 리스트
  final List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: '카테고리',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '홈페이지',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'My',
    ),
    BottomNavigationBarItem(
      icon: Icon(MdiIcons.forumOutline),
      label: '커뮤니티페이지',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // 현재 선택된 페이지 표시
      bottomNavigationBar: BottomNavigationBar(
        items: _navItems,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // 4개 이상의 아이템을 위해 fixed 타입 사용
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 탭 선택 시 인덱스 업데이트
          });
        },
      ),
    );
  }
}
