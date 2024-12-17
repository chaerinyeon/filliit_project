import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/situation_tab/message/message_work/message_work_high/message_work_high_etc/new_year_card/body.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  String? _introValue;

  final List<String> introOptions = [
    "안녕하십니까,  [성함]님. 새해를 맞이하여 인사드립니다.",
    "존경하는  [성함]님, 희망찬 새해를 맞아 감사의 마음을 전합니다.",
    "안녕하신지요,  [성함]님. 새해를 맞아 마음을 담은 인사를 올립니다."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('서론 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '원하는 서론 문장을 선택해주세요.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ...introOptions.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: _introValue,
                onChanged: (value) {
                  setState(() {
                    _introValue = value;
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _introValue == null
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BodyPage(intro: _introValue!),
                        ),
                      );
                    },
              child: Text('다음'),
            ),
          ],
        ),
      ),
    );
  }
}
