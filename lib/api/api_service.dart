// import 'dart:collection';
// import 'dart:convert';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import '../controller/user_controller.dart';
// import '../enum/error_type.dart';
// import 'logging_dio_interceptor.dart';
//
// class ApiService {
//   static final Dio _dio = Dio();
//
//   final UserController _userController = Get.find();
//
//   ApiService() {
//     _dio.interceptors.add(LoggingDioInterceptor());
//   }
//
//   Future<void> postRequest({
//     required String url,
//     dynamic params,
//     required Function(Map<String, dynamic>) onSuccess,
//     required Function(ErrorType, String) onError,
//   }) async {
//     try {
//       print('Method => POST , API URL ==> $url');
//       print('Params ==> $params');
//       var response = await _dio.post(url, data: params);
//       log("response  ===>  $response");
//       if (response.statusCode != 200) {
//         onError(ErrorType.none, response.data['message']);
//       } else {
//         if (response.data["status"] != null) {
//           if (response.data["status"] == false) {
//             onError(ErrorType.none, response.data['message']);
//             return;
//           }
//         }
//         Map<String, dynamic> data = Map();
//         data["response"] = response.data;
//         onSuccess(data);
//       }
//     } on DioError catch (e) {
//       print('Error  ===>  $e  ${e.response}  ${e.type}');
//       if (e.type == DioErrorType.other) {
//         onError(ErrorType.internet, e.message);
//       }
//       if (e.response != null) {
//         print('Error  ===>  ${e.response?.data}  ${e.type}');
//         onError(ErrorType.none,
//             e.response?.data['message'] ?? e.response?.data['error']);
//       }
//     }
//     return;
//   }
//
//   Future<void> getRequest({
//     required String url,
//     Map<String, dynamic>? header,
//     required Function(Map<String, dynamic>) onSuccess,
//     required Function(ErrorType, String?) onError,
//   }) async {
//     try {
//       print('Method => GET , API URL ==> $url');
//       if (header != null) {
//         _dio.options.headers.addAll(header);
//       }
//       var response = await _dio.get(url);
//       log('response  ===>  $response');
//       Map<String, dynamic> data = {};
//       data["response"] = jsonDecode(response.data);
//       if (response.statusCode != 200) {
//         onError(ErrorType.none, data["response"][0]["msg"]);
//       } else {
//         if(data["response"] is List){
//           if (data["response"][0]["status"] != null) {
//             if (data["response"][0]["status"] == false) {
//               onError(ErrorType.none, data["response"][0]["msg"]);
//               return;
//             }
//           }
//         }else{
//           if (data["response"]["status"] != null) {
//             if (data["response"]["status"] == false) {
//               onError(ErrorType.none, data["response"]["msg"]);
//               return;
//             }
//           }
//         }
//         onSuccess(data);
//       }
//     } on DioError catch (e) {
//       if (e.type == DioErrorType.other) {
//         onError(ErrorType.internet, null);
//       }
//       if (e.response != null) {
//         Map<String, dynamic> data = {};
//         data["response"] = jsonDecode(e.response?.data);
//         onError(ErrorType.none, data["response"][0]["msg"]);
//       }
//     }
//     return;
//   }
//
//   Future<void> deleteRequest({
//     required String url,
//     Map<String, dynamic>? header,
//     required Function(Map<String, dynamic>) onSuccess,
//     required Function(ErrorType, String?) onError,
//   }) async {
//     try {
//       print('Method => DELETE , API URL ==> $url');
//       if (header != null) {
//         _dio.options.headers.addAll(header);
//       } else {
//       }
//       var response = await _dio.delete(url);
//       log('response  ===>  $response');
//       if (response.statusCode != 200) {
//         onError(ErrorType.none, response.data['message']);
//       } else {
//         if (response.data is HashMap) {
//           if (response.data["status"] != null) {
//             if (response.data["status"] == false) {
//               onError(ErrorType.none, response.data['message']);
//               return;
//             }
//           }
//         }
//         Map<String, dynamic> data = Map();
//         data["response"] = response.data;
//         onSuccess(data);
//       }
//     } on DioError catch (e) {
//       print('Error 12 ===>  $e    ${e.type}');
//       if (e.type == DioErrorType.other) {
//         onError(ErrorType.internet, null);
//       }
//       if (e.response != null) {
//         print('Error12  ===>  ${e.response?.data}');
//         onError(ErrorType.none,
//             e.response?.data['message'] ?? e.response?.data["error"]);
//       }
//     }
//     return;
//   }
//
//   Future<void> putRequest({
//     required String url,
//     dynamic params,
//     required Function(Map<String, dynamic>) onSuccess,
//     required Function(ErrorType, String?) onError,
//   }) async {
//     try {
//       print('Method => PUT , API URL ==> $url');
//       print('Params ==> $params');
//
//       var response = await _dio.put(url, data: params);
//       log("response   ===>   $response");
//       onSuccess(json.decode(response.toString()));
//     } on DioError catch (e) {
//       print('Error 12 ===>  $e    ${e.type}');
//       if (e.type == DioErrorType.other) {
//         onError(ErrorType.internet, null);
//       }
//       if (e.response != null) {
//         print('Error12  ===>  ${e.response?.data}');
//         onError(ErrorType.none, e.response?.data['message']);
//       }
//     }
//     return;
//   }
// }
//
// ApiService apiService = ApiService();
