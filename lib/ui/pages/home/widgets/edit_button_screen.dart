import 'package:flutter/material.dart';
import 'editable_buttons_box.dart'; // CustomButton 클래스 임포트

class EditButtonsScreen extends StatefulWidget {
  final List<CustomButton> buttons;

  EditButtonsScreen({required this.buttons});

  @override
  _EditButtonsScreenState createState() => _EditButtonsScreenState();
}

class _EditButtonsScreenState extends State<EditButtonsScreen> {
  late List<CustomButton> editableButtons;

  @override
  void initState() {
    super.initState();
    // 버튼 목록을 복사하여 편집
    editableButtons = List.from(widget.buttons);
  }

  void _addButton() {
    showDialog(
      context: context,
      builder: (context) {
        String label = '';
        IconData icon = Icons.add;
        Color color = Colors.blue;

        return AlertDialog(
          title: Text('새 버튼 추가'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: '버튼 라벨'),
                  onChanged: (value) {
                    label = value;
                  },
                ),
                SizedBox(height: 10),
                // 아이콘 선택 드롭다운
                DropdownButtonFormField<IconData>(
                  decoration: InputDecoration(labelText: '아이콘 선택'),
                  value: icon,
                  items: [
                    DropdownMenuItem(
                      child: Icon(Icons.add),
                      value: Icons.add,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.edit),
                      value: Icons.edit,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.delete),
                      value: Icons.delete,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.star),
                      value: Icons.star,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.favorite),
                      value: Icons.favorite,
                    ),
                    // 필요한 아이콘 추가
                  ],
                  onChanged: (value) {
                    if (value != null) icon = value;
                  },
                ),
                SizedBox(height: 10),
                // 색상 선택 드롭다운
                DropdownButtonFormField<Color>(
                  decoration: InputDecoration(labelText: '색상 선택'),
                  value: color,
                  items: [
                    DropdownMenuItem(
                      child: Text('파랑'),
                    ),
                    DropdownMenuItem(
                      child: Text('초록'),
                    ),
                    DropdownMenuItem(
                      child: Text('빨강'),
                    ),
                    DropdownMenuItem(
                      child: Text('노랑'),
                    ),
                    DropdownMenuItem(
                      child: Text('보라'),
                    ),
                    // 필요한 색상 추가
                  ],
                  onChanged: (value) {
                    if (value != null) color = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 취소
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                if (label.isNotEmpty) {
                  setState(() {
                    editableButtons.add(
                        CustomButton(label: label, icon: icon, color: color));
                  });
                  Navigator.of(context).pop(); // 추가 후 닫기
                }
              },
              child: Text('추가'),
            ),
          ],
        );
      },
    );
  }

  void _removeButton(int index) {
    setState(() {
      editableButtons.removeAt(index);
    });
  }

  void _reorderButtons(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final button = editableButtons.removeAt(oldIndex);
      editableButtons.insert(newIndex, button);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('버튼 편집'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addButton,
            tooltip: '버튼 추가',
          ),
        ],
      ),
      body: ReorderableListView.builder(
        itemCount: editableButtons.length,
        onReorder: _reorderButtons,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        itemBuilder: (context, index) {
          final button = editableButtons[index];
          return ListTile(
            key: ValueKey(button),
            leading: Icon(button.icon, color: button.color),
            title: Text(button.label),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _removeButton(index),
            ),
            // 드래그 핸들러 추가
            onLongPress: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(editableButtons); // 편집 완료 후 버튼 목록 반환
        },
        child: Icon(Icons.save),
        tooltip: '저장',
      ),
    );
  }
}
