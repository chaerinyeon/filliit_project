import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fillit_app/firebase_options.dart';
import 'package:flutter_fillit_app/ui/main/main_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // firebase_options.dart 사용 시
  );
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
