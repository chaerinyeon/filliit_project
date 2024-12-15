// lib/ui/widgets/situation_radio_buttons.dart

import 'package:flutter/material.dart';

class SituationRadioButtons extends StatefulWidget {
  final List<String> situations; // 상황 목록
  final String? initialSelected; // 초기 선택된 상황
  final Function(String) onChanged; // 선택 변경 시 호출되는 콜백

  SituationRadioButtons({
    required this.situations,
    this.initialSelected,
    required this.onChanged,
  });

  @override
  _SituationRadioButtonsState createState() => _SituationRadioButtonsState();
}

class _SituationRadioButtonsState extends State<SituationRadioButtons> {
  String? _selectedSituation;

  @override
  void initState() {
    super.initState();
    _selectedSituation = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.situations.map((situation) {
        return RadioListTile<String>(
          title: Text(situation),
          value: situation,
          groupValue: _selectedSituation,
          onChanged: (value) {
            setState(() {
              _selectedSituation = value;
            });
            widget.onChanged(value!);
          },
        );
      }).toList(),
    );
  }
}
