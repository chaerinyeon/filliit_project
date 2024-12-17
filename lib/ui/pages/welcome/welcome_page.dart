// // lib/ui/pages/welcome/welcome_page.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_fillit_app/ui/pages/login/login_page.dart';
// import 'package:flutter_fillit_app/ui/pages/join/join_page.dart';

// class WelcomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // 전체 화면을 배경 이미지로 꾸미려면 decoration을 사용하세요.
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 '환영합니다!\nFillit 앱에 오신 것을 환영합니다.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white, // 배경 이미지에 따라 텍스트 색상 조정
//                 ),
//               ),
//               SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: () {
//                   // 로그인 페이지로 이동
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginPage()),
//                   );
//                 },
//                 child: Text('로그인'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 50),
//                   backgroundColor: Colors.deepPurpleAccent, // 버튼 색상
//                   textStyle: TextStyle(fontSize: 18),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // 회원가입 페이지로 이동
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => JoinPage()),
//                   );
//                 },
//                 child: Text('회원가입'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 50),
//                   backgroundColor: Colors.deepPurpleAccent, // 버튼 색상
//                   textStyle: TextStyle(fontSize: 18),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
