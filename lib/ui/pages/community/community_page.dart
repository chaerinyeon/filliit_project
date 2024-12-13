// lib/ui/pages/community/community_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_tabs/all_commu_tabs.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_tabs/free_board_tab.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_tabs/information_sharing_tab.dart';
import 'package:flutter_fillit_app/ui/pages/community/commu_tabs/qna_tab.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: '전체'),
    Tab(text: '정보공유'),
    Tab(text: 'QnA'),
    Tab(text: '자유게시판'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('커뮤니티 페이지'),
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
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: myTabs,
            indicatorColor: const Color.fromARGB(255, 139, 62, 255),
            labelColor: const Color.fromARGB(255, 139, 62, 255),
            unselectedLabelColor: const Color.fromARGB(179, 91, 90, 90),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            AllTab(),
            InformationSharingTab(),
            QnATab(),
            FreeBoardTab(),
          ],
        ),
      ),
    );
  }
}
