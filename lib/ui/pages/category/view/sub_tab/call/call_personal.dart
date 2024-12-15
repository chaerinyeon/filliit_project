// lib/ui/pages/category/view/sub_tab/call/call_personal.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/widgets/vertical_tab.dart';

class CallPersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalTabWidget(
      tabs: ['연락처', '통화 기록', '설정'], // 세로 탭 라벨
      children: [
        // 각 세로 탭에 대한 콘텐츠
        Center(child: Text('개인 연락처 콘텐츠')),
        Center(child: Text('개인 통화 기록 콘텐츠')),
        Center(child: Text('개인 통화 설정 콘텐츠')),
      ],
      selectedColor: Colors.green, // 선택된 탭 색상
      unselectedColor: Colors.black, // 선택되지 않은 탭 색상
      indicatorColor: Colors.green, // 인디케이터 색상
    );
  }
}
