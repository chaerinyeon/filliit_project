import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/widgets/row_selection.dart';

class ButtonGroupDemo extends StatefulWidget {
  @override
  _ButtonGroupDemoState createState() => _ButtonGroupDemoState();
}

class _ButtonGroupDemoState extends State<ButtonGroupDemo> {
  String _currentSelection = 'category1';

  final List<String> _categories = ['category1', 'category2', 'category3'];
  final Map<String, String> _displayLabels = {
    'category1': 'Left',
    'category2': 'Middle',
    'category3': 'Right',
  };

  void _onCategorySelected(String category) {
    setState(() {
      _currentSelection = category;
    });
    // 선택된 카테고리에 따른 추가 동작을 여기에 추가할 수 있습니다.
    print('$category selected');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segmented Control Button Group'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectionRow(
            categories: _categories,
            selectedCategory: _currentSelection,
            onCategorySelected: _onCategorySelected,
            displayLabels: _displayLabels,
          ),
          SizedBox(height: 20),
          Text(
            'Selected: ${_displayLabels[_currentSelection] ?? _currentSelection}',
            style: TextStyle(fontSize: 18),
          ),
          // 선택된 버튼에 따른 다른 위젯을 추가할 수 있습니다.
        ],
      ),
    );
  }
}
