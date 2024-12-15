// lib/ui/pages/category/view/sub_tab/call/call_personal_family.dart

import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/target_tab/widgets/situation_radio_buttons.dart';

class CallPersonalFamily extends StatefulWidget {
  @override
  _CallPersonalFamilyState createState() => _CallPersonalFamilyState();
}

class _CallPersonalFamilyState extends State<CallPersonalFamily> {
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
        ],
      ),
    );
  }
}
