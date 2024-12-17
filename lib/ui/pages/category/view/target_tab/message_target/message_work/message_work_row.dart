import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/widgets/situation_radio_buttons.dart';

class MessageWorkRow extends StatefulWidget {
  @override
  _MessageWorkRowState createState() => _MessageWorkRowState();
}

class _MessageWorkRowState extends State<MessageWorkRow> {
  final List<String> _callPersonalFamilySituations = [
    '옵션 1',
    '옵션 2',
    '옵션 3',
  ];

  String? _selectedSituation;

  void _handleSituationChange(String situation) {
    setState(() {
      _selectedSituation = situation;
    });
    print('선택된 상황: $situation');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SituationRadioButtons(
            situations: _callPersonalFamilySituations,
            initialSelected: _selectedSituation,
            onChanged: _handleSituationChange,
          ),
          SizedBox(height: 20),
          _selectedSituation != null
              ? Text(
                  '선택된 상황: $_selectedSituation',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              : Text(
                  '상황이 선택되지 않았습니다.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
          // 상황이 선택되었을 때만 ElevatedButton 표시
          _selectedSituation != null
              ? ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Data title'),
                        content: Text('전화 , 개인->가족 + $_selectedSituation 상황'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('확인'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text('click me'),
                )
              : SizedBox.shrink(), // 상황이 선택되지 않았을 때 빈 공간을 차지하지 않음
        ],
      ),
    );
  }
}
