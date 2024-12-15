import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/ui/main/main_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // MyApp은 앱의 루트 위젯입니다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fillit',
      theme: ThemeData(
          primarySwatch: Colors.purple, buttonTheme: ButtonThemeData()),
      home: MainPage(), // MainPage를 홈으로 설정
    );
  }
}
