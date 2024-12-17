import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/situation_tab/message/message_work/message_work_high/message_work_high_etc/new_year_card/conclus.dart';

class BodyPage extends StatefulWidget {
  final String intro;

  BodyPage({required this.intro});

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  String? _bodyValue;

  final List<String> bodyOptions = [
    "지난 한 해 동안 [성함]님께서 보여주신 지원과 격려 덕분에 많은 성과를 이룰 수 있었습니다. 이 자리를 빌려 다시 한 번 감사의 뜻을 전합니다.",
    "덕분에 저희가 목표를 달성할 수 있었으며, 이는 [성함]님의 관심과 지원 덕택이라 생각합니다.",
    "귀한 조언과 격려 덕에 한 해 동안 큰 성장을 이룰 수 있었습니다."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('본론 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '원하는 본론 문장을 선택해주세요.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ...bodyOptions.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: _bodyValue,
                onChanged: (value) {
                  setState(() {
                    _bodyValue = value;
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _bodyValue == null
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConclusionPage(
                            intro: widget.intro,
                            body: _bodyValue!,
                          ),
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
