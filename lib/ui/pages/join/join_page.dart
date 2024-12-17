// // lib/ui/pages/join/join_page.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_fillit_app/core/snackbar_util.dart';
// import 'package:flutter_fillit_app/ui/pages/login/login_page.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class JoinPage extends ConsumerStatefulWidget {
//   // 생성자에서 인자를 제거합니다.
//   JoinPage({Key? key}) : super(key: key);

//   @override
//   _JoinPageState createState() => _JoinPageState();
// }

// class _JoinPageState extends ConsumerState<JoinPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPwController = TextEditingController();

//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPwController.dispose();
//     super.dispose();
//   }

//   void _signUp(dynamic joinViewModelProvider) async {
//     if (_formKey.currentState?.validate() ?? false) {
//       // 비밀번호 일치 확인
//       if (_passwordController.text != _confirmPwController.text) {
//         SnackbarUtil.showSnackBar(
//           context,
//           '비밀번호가 일치하지 않습니다.',
//           backgroundColor: Colors.red,
//         );
//         return;
//       }

//       setState(() {
//         _isLoading = true;
//       });

//       final viewModel = ref.read(joinViewModelProvider.notifier);
//       final signUpResult = await viewModel.signUp(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       setState(() {
//         _isLoading = false;
//       });

//       if (signUpResult) {
//         // 회원가입 성공
//         SnackbarUtil.showSnackBar(context, '회원가입이 완료되었습니다.',
//             backgroundColor: Colors.blue);
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => LoginPage()),
//           (route) => false,
//         );
//       } else {
//         // 회원가입 실패
//         SnackbarUtil.showSnackBar(
//           context,
//           '회원가입에 실패했습니다.',
//           backgroundColor: Colors.red,
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('회원가입'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: _isLoading
//               ? Center(child: CircularProgressIndicator())
//               : Form(
//                   key: _formKey,
//                   child: ListView(
//                     children: [
//                       TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           labelText: '이메일',
//                           border: OutlineInputBorder(),
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return '이메일을 입력해주세요.';
//                           }
//                           // 간단한 이메일 형식 검증
//                           if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//                               .hasMatch(value.trim())) {
//                             return '유효한 이메일을 입력해주세요.';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: _passwordController,
//                         decoration: InputDecoration(
//                           labelText: '비밀번호',
//                           border: OutlineInputBorder(),
//                         ),
//                         obscureText: true,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return '비밀번호를 입력해주세요.';
//                           }
//                           if (value.trim().length < 6) {
//                             return '비밀번호는 최소 6자 이상이어야 합니다.';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: _confirmPwController,
//                         decoration: InputDecoration(
//                           labelText: '비밀번호 확인',
//                           border: OutlineInputBorder(),
//                         ),
//                         obscureText: true,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return '비밀번호 확인을 입력해주세요.';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 30),
//                       ElevatedButton(
//                         child: Text('회원가입'),
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: Size(double.infinity, 50), // 버튼 너비 확장
//                         ),
//                         onPressed: () {},
//                       ),
//                       SizedBox(height: 10),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginPage()),
//                             (route) => false,
//                           );
//                         },
//                         child: Text('이미 계정이 있으신가요? 로그인'),
//                       ),
//                     ],
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }
