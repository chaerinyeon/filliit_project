import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/pages/category/view/situation_tab/message/message_work/message_work_high/message_work_high_etc/new_year_card/final.dart';

class ConclusionPage extends StatefulWidget {
  final String intro;
  final String body;

  ConclusionPage({required this.intro, required this.body});

  @override
  _ConclusionPageState createState() => _ConclusionPageState();
}

class _ConclusionPageState extends State<ConclusionPage> {
  String? _conclusionValue;

  final List<String> conclusionOptions = [
    "다가오는 새해에도 [성함]님의 건강과 번영을 기원하며, 앞으로도 저희가 성장할 수 있도록 변함없는 지도 부탁드립니다.",
    "새해에는 더 큰 발전과 풍요가 [성함]님께 함께하시길 바라며, 언제나 건강과 행복이 가득하시길 기원합니다.",
    "2024년에도 [성함]님께서 계획하신 모든 일이 원활히 진행되길 바라며, 저희 또한 성심껏 보좌하겠습니다."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('결론 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '원하는 결론 문장을 선택해주세요.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ...conclusionOptions.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: _conclusionValue,
                onChanged: (value) {
                  setState(() {
                    _conclusionValue = value;
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _conclusionValue == null
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FinalPage(
                            intro: widget.intro,
                            body: widget.body,
                            conclusion: _conclusionValue!,
                          ),
                        ),
                      );
                    },
              child: Text('전체 문장 보기'),
            ),
          ],
        ),
      ),
    );
  }
}
