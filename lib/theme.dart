// import 'package:flutter/material.dart';

// final lightTheme = ThemeData(
//     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
//     highlightColor: Colors.deepPurpleAccent,
//     appBarTheme: const AppBarTheme(
//         // centerTitle: false,
//         // titleTextStyle: TextStyle(
//         //   fontSize: 18,
//         //   color: Colors.black,
//         //   fontWeight: FontWeight.bold,
//         // )
//         ),
//     elevatedButtonTheme: const ElevatedButtonThemeData(
//         style: ButtonStyle(
//             foregroundColor: WidgetStatePropertyAll(Colors.white),
//             backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent),
//             minimumSize: WidgetStatePropertyAll(Size.fromHeight(50)),
//             textStyle: WidgetStatePropertyAll(
//               TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ))),
//     inputDecorationTheme: InputDecorationTheme(
//         hintStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//           color: Colors.grey,
//         ),
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 16,
//           horizontal: 20,
//         ),
//         border: MaterialStateOutlineInputBorder.resolveWith((states) {
//           // print(states);
//           // 1. states Set 안에 WidgetState.focused 가 포함이 되어있을때
//           if (states.contains(WidgetState.focused)) {
//             return OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: Colors.grey,
//                 width: 2,
//               ),
//             );
//           }
//           WidgetState;
//           // 2. states Set 안에 WidgetState.error 가 포함이 되어있을때
//           if (states.contains(WidgetState.error)) {
//             return OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: Colors.red,
//                 width: 2,
//               ),
//             );
//           }

//           // 3. 디폴트값
//           return OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               color: Colors.grey[300]!,
//               width: 1,
//             ),
//           );
//         })));

// final darkTheme = ThemeData();
