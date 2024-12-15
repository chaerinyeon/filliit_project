// lib/ui/pages/category/view/sub_tab/message/message_personal.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/widgets/vertical_tab.dart';

class MessagePersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalTabWidget(
      tabs: ['받은 편지함', '보낸 편지함', '임시 보관함'], // 세로 탭 라벨
      children: [
        // 각 세로 탭에 대한 콘텐츠
        Center(child: Text('개인 받은 편지함 콘텐츠')),
        Center(child: Text('개인 보낸 편지함 콘텐츠')),
        Center(child: Text('개인 임시 보관함 콘텐츠')),
      ],
      selectedColor: Colors.orange, // 선택된 탭 색상
      unselectedColor: Colors.black, // 선택되지 않은 탭 색상
      indicatorColor: Colors.orange, // 인디케이터 색상
    );
  }
}
