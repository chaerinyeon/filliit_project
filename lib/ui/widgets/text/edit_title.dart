// import 'package:flutter/material.dart';

// void _editTitle() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         String tempTitle = title;
//         return AlertDialog(
//           title: Text('직함 수정'),
//           content: TextField(
//             onChanged: (value) {
//               tempTitle = value;
//             },
//             controller: TextEditingController(text: title),
//             decoration: InputDecoration(
//               labelText: '새 직함',
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
//                   title = tempTitle;
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
