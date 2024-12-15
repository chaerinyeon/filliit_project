// lib/ui/widgets/custom/vertical_tab_widget.dart

import 'package:flutter/material.dart';

class VerticalTabWidget extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> children;
  final Color selectedColor;
  final Color unselectedColor;
  final Color indicatorColor;

  const VerticalTabWidget({
    Key? key,
    required this.tabs,
    required this.children,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.black,
    this.indicatorColor = Colors.blue,
  }) : super(key: key);

  @override
  _VerticalTabWidgetState createState() => _VerticalTabWidgetState();
}

class _VerticalTabWidgetState extends State<VerticalTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _verticalTabController;

  @override
  void initState() {
    super.initState();
    _verticalTabController =
        TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _verticalTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 세로 탭 바
        Container(
          width: 80, // 세로 탭의 너비 조정
          child: RotatedBox(
            quarterTurns: -1, // TabBar를 세로로 회전
            child: TabBar(
              controller: _verticalTabController,
              isScrollable: true,
              indicator: BoxDecoration(
                color: widget.indicatorColor,
                borderRadius: BorderRadius.circular(4),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: widget.unselectedColor,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              tabs: widget.tabs
                  .map((tab) => RotatedBox(
                        quarterTurns: 1, // 각 탭의 텍스트를 다시 회전
                        child: Tab(text: tab),
                      ))
                  .toList(),
            ),
          ),
        ),
        // 세로 탭 콘텐츠
        Expanded(
          child: TabBarView(
            controller: _verticalTabController,
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
