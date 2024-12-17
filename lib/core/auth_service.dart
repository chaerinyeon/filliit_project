// // lib/data/service/auth_service.dart

// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _firebaseAuth;

//   AuthService({FirebaseAuth? firebaseAuth})
//       : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

//   // 인증 상태 변경 스트림
//   Stream<User?> get user {
//     return _firebaseAuth.authStateChanges();
//   }

//   // 현재 로그인된 사용자 가져오기
//   User? get currentUser {
//     return _firebaseAuth.currentUser;
//   }

//   // 회원가입
//   Future<String?> signUp(
//       {required String email, required String password}) async {
//     try {
//       await _firebaseAuth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return null; // 성공 시 null 반환
//     } on FirebaseAuthException catch (e) {
//       return e.message; // 실패 시 에러 메시지 반환
//     }
//   }

//   // 로그인
//   Future<String?> signIn(
//       {required String email, required String password}) async {
//     try {
//       await _firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return null; // 성공 시 null 반환
//     } on FirebaseAuthException catch (e) {
//       return e.message; // 실패 시 에러 메시지 반환
//     }
//   }

//   // 로그아웃
//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }
// }
