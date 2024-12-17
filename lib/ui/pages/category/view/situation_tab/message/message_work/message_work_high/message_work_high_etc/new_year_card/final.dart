import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/main/main_state.dart';
import 'package:flutter_fillit_app/ui/pages/home/home_page.dart';

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

// 최종 페이지
class FinalPage extends StatefulWidget {
  final String intro;
  final String body;
  final String conclusion;

  FinalPage(
      {required this.intro, required this.body, required this.conclusion});

  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  String name = '[성함]'; // 초기 이름

  @override
  Widget build(BuildContext context) {
    // 선택된 문장에 이름과 직함을 삽입
    // ignore: unused_local_variable
    String finalMessage =
        "${widget.intro.replaceAll('[성함]', name)} ${widget.body.replaceAll('[성함]', name)} ${widget.conclusion.replaceAll('[성함]', name)}";

    return Scaffold(
      appBar: AppBar(
        title: Text('최종 문장'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '아래는 선택하신 문장을 모두 조합한 결과입니다.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // RichText로 편집 가능한 부분 만들기
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    // 서론 부분
                    TextSpan(text: widget.intro.replaceAll('[성함]', '')),
                    TextSpan(text: " "),
                    // 성함 편집
                    TextSpan(
                      text: name,
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _editName();
                        },
                    ),
                    TextSpan(text: " "),
                    // 직함 편집
                    TextSpan(
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _editTitle();
                        },
                    ),
                    TextSpan(text: "님, "),
                    // 나머지 본론과 결론
                    TextSpan(
                      text: widget.body.replaceAll('[성함]', name),
                    ),
                    TextSpan(text: " "),
                    TextSpan(text: widget.conclusion.replaceAll('[성함]', name)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // 여기서 메시지를 복사하거나 다른 작업을 할 수 있습니다.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('메시지가 업데이트되었습니다!')),
                  );
                },
                child: Text('메시지 업데이트'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MainPage()));
                },
                child: Text('처음으로 돌아가기'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 이름 수정 함수
  void _editName() {
    showDialog(
      context: context,
      builder: (context) {
        String tempName = name;
        return AlertDialog(
          title: Text('성함 수정'),
          content: TextField(
            onChanged: (value) {
              tempName = value;
            },
            controller: TextEditingController(text: name),
            decoration: InputDecoration(
              labelText: '새 성함',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  name = tempName;
                });
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  // 직함 수정 함수
  void _editTitle() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('직함 수정'),
          content: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: '새 직함',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
