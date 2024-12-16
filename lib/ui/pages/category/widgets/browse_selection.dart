// lib/ui/widgets/browse_selection.dart

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_fillit_app/ui/pages/category/model/tab_item.dart';

class BrowseSelection extends StatefulWidget {
  final List<TabItem> tabs;
  final List<Widget> pages;
  final Color selectedColor;
  final Color unselectedColor;
  final Color indicatorColor;
  final Function(TabItem) onCategorySelected; // TabItem을 인자로 받는 콜백

  BrowseSelection({
    required this.tabs,
    required this.pages,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.black,
    this.indicatorColor = Colors.blue,
    required this.onCategorySelected,
  });

  @override
  _BrowseSelectionState createState() => _BrowseSelectionState();
}

class _BrowseSelectionState extends State<BrowseSelection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 탭 바
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: widget.tabs
                .asMap()
                .entries
                .map((entry) => _buildTabItem(entry.key, entry.value))
                .toList(),
          ),
        ),
        // 인디케이터
        Container(
          height: 3,
          width: double.infinity,
          color: widget.indicatorColor.withOpacity(0.2),
          child: Stack(
            children: [
              AnimatedAlign(
                duration: Duration(milliseconds: 300),
                alignment: Alignment(
                    (_selectedIndex / (widget.tabs.length - 1)) * 2 - 1, 0),
                child: Container(
                  height: 3,
                  width: MediaQuery.of(context).size.width / widget.tabs.length,
                  color: widget.selectedColor,
                ),
              ),
            ],
          ),
        ),
        // 콘텐츠 (Expanded 제거)
        // widget.pages[_selectedIndex], // 필요하다면 제거하거나 다른 방식으로 관리
      ],
    );
  }

  Widget _buildTabItem(int index, TabItem tab) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          widget.onCategorySelected(tab); // TabItem을 인자로 콜백 호출
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tab.title,
                  style: TextStyle(
                    color: isSelected
                        ? widget.selectedColor
                        : widget.unselectedColor,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                if (tab.badgeCount != null) SizedBox(width: 4),
                if (tab.badgeCount != null)
                  badges.Badge(
                    badgeContent: Text(
                      '${tab.badgeCount}',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    child: SizedBox(width: 0, height: 0),
                  ),
              ],
            ),
            SizedBox(height: 4),
            if (isSelected)
              Container(
                height: 3,
                width: double.infinity,
                color: widget.selectedColor,
              ),
          ],
        ),
      ),
    );
  }
}
