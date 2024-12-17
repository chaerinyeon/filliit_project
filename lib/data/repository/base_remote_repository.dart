// import 'package:dio/dio.dart';

// abstract class BaseRemoteRepository {
//   //
//   Dio get client => _client;

//   String? get bearerToken => interceptor.bearerToken;

//   static Dio _client = Dio(
//     BaseOptions(
//       baseUrl: 'http://192.168.1.154',
//       validateStatus: (status) => true,
//     ),
//   )..interceptors.add(interceptor);

//   static AuthInterceptor interceptor = AuthInterceptor();
// }

// class AuthInterceptor extends Interceptor {
//   String? bearerToken;

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // 반드시 부모클래스의 onRequest 호출해줘야함!
//     if (bearerToken != null) {
//       options.headers.addAll({
//         'Authorization': bearerToken,
//       });
//     }
//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // response 의 uri가 /login 일때!, 응답코드가 200일때
//     // http://localhost:8080/login
//     if (response.realUri.path == '/login' && response.statusCode == 200) {
//       final token = response.headers['Authorization'];
//       bearerToken = token?.first;

//       print('로그인 성공함 : $bearerToken');
//     }

//     super.onResponse(response, handler);
//   }
// }
