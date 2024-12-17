// import 'package:flutter/material.dart';

// void _editName() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         String tempName = name;
//         return AlertDialog(
//           title: Text('성함 수정'),
//           content: TextField(
//             onChanged: (value) {
//               tempName = value;
//             },
//             controller: TextEditingController(text: name),
//             decoration: InputDecoration(
//               labelText: '새 성함',
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // 다이얼로그 닫기
//               },
//               child: Text('취소'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   name = tempName;
//                 });
//                 Navigator.of(context).pop(); // 다이얼로그 닫기
//               },
//               child: Text('확인'),
//             ),
//           ],
//         );
//       },
//     );
//   }
