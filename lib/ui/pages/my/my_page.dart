import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/widgets/row_selection.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // 두 번째 선택 Row의 선택 상태
  String _selectedPhraseCategory = 'recent'; // 초기 선택값을 'recent'로 설정

  // 두 번째 카테고리 리스트
  final List<String> _phraseCategories = ['recent', 'favorite', 'recommended'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My 페이지'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 두 번째 카테고리 선택 Row
            SelectionRow(
              categories: _phraseCategories,
              selectedCategory: _selectedPhraseCategory,
              onCategorySelected: (category) {
                setState(() {
                  _selectedPhraseCategory = category;
                });
              },
              displayLabels: {
                'recent': '최근 본 문구',
                'favorite': '찜한 문구',
                'recommended': '추천하는 문구',
              },
            ),
            SizedBox(height: 20),
            // 선택된 문구 카테고리에 따른 내용 표시
            Expanded(
              child: Center(
                child: Text(
                  '선택된 문구 카테고리: ${_selectedPhraseCategory == 'recent' ? '최근 본 문구' : _selectedPhraseCategory == 'favorite' ? '찜한 문구' : '추천하는 문구'}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
