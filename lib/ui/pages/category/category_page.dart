// lib/ui/pages/category_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/widgets/row_selection.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // 첫 번째 선택 Row의 선택 상태
  String _selectedCategory = 'call'; // 초기 선택값을 'call'로 설정

  // 카테고리 리스트
  final List<String> _categories = ['call', 'message', 'mail'];

  // displayLabels map
  final Map<String, String> _displayLabels = {
    'call': 'Call',
    'message': 'Message',
    'mail': 'Mail',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        actions: [
          IconButton(
            onPressed: () {
              // Search button clicked
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Search button clicked')),
              );
            },
            icon: const Icon(Icons.search_outlined),
          ),
          IconButton(
            onPressed: () {
              // Alarm button clicked
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Alarm button clicked')),
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
            // 카테고리 선택 Row
            SelectionRow(
              categories: _categories,
              selectedCategory: _selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
              displayLabels: _displayLabels,
            ),
            SizedBox(height: 20),
            // 선택된 카테고리에 따른 내용 표시
            Expanded(
              child: Center(
                child: Text(
                  'Selected Category: ${_displayLabels[_selectedCategory] ?? _selectedCategory}',
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
