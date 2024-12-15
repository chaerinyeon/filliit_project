import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/home/widgets/edit_button_screen.dart';

class EditableButtonsBox extends StatefulWidget {
  @override
  _EditableButtonsBoxState createState() => _EditableButtonsBoxState();
}

class _EditableButtonsBoxState extends State<EditableButtonsBox> {
  List<CustomButton> buttons = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 10.0,
            offset: Offset(5, 5),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 10.0,
            offset: Offset(-5, -5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // 버튼들 배치
          Column(
            mainAxisSize: MainAxisSize.min,
            children: buttons.map((button) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: button.color,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  icon: Icon(button.icon, size: 24.0),
                  label: Text(
                    button.label,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${button.label} 클릭됨')),
                    );
                  },
                ),
              );
            }).toList(),
          ),
          // 편집 버튼 배치
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.edit, color: Colors.black54),
              onPressed: () async {
                // 편집 화면으로 이동하고, 결과 받기
                final updatedButtons = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditButtonsScreen(buttons: buttons),
                  ),
                );

                // 결과가 null이 아니면 업데이트
                if (updatedButtons != null &&
                    updatedButtons is List<CustomButton>) {
                  setState(() {
                    buttons = updatedButtons;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 커스텀 버튼 데이터 클래스
class CustomButton {
  String label;
  IconData icon;
  Color color;

  CustomButton({required this.label, required this.icon, required this.color});
}
