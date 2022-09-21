// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../api/api.dart';
// import '../api/api_service.dart';
// import '../enum/error_type.dart';
// import 'base_controller.dart';
//
// class UserController extends BaseController {
//   Rx<UserDataModelElement> userData = UserDataModelElement().obs;
//   final UserDetails _userDetails = UserDetails();
//
//   Rx<CreateUserModel> createUserData = CreateUserModel().obs;
//   Rx<com.CreateCompanyModel> createCompanyData = com.CreateCompanyModel().obs;
//   Rx<CheckCompanyModel> checkCompanyData = CheckCompanyModel().obs;
//
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   TextEditingController registerUsernameController = TextEditingController();
//   TextEditingController registerPasswordController = TextEditingController();
//   TextEditingController registerCompanyController = TextEditingController();
//   RxString errorCompanyName = "".obs;
//   RxString errorUserName = "".obs;
//
//   String? _registerToken;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _userDetails.getSaveUserDetails.then((value) {
//       log("userTokenAccess ====>   ${value.toJson()}");
//       userData.value = value;
//     });
//     userData.listen((data) {
//       _userDetails.saveUserDetails(data);
//     });
//   }
//
//   Future<void> loginUser() async {
//     removeUnFocusManager();
//
//     try {
//       if (usernameController.text.isEmpty) {
//         showError(msg: 'Please Enter Username');
//         return;
//       }
//       if (passwordController.text.isEmpty) {
//         showError(msg: 'Please Enter Password');
//         return;
//       }
//       showLoader();
//
//       Map<String, dynamic> params = {};
//
//       params['login'] = usernameController.text;
//       params['password'] = passwordController.text;
//
//       String query = Uri(queryParameters: params).query;
//       apiService.getRequest(
//           url: "${ApiUrl.login}?$query",
//           onSuccess: (Map<String, dynamic> data) {
//             dismissLoader();
//             List<dynamic> userDataList =
//                 userDataModelFromJson(jsonEncode(data["response"]));
//
//             userData.value = UserDataModelElement.fromJson(userDataList[1][0]);
//             userData.refresh();
//             Get.offAll(() => const HomeScreen());
//           },
//           onError: (ErrorType errorType, String? msg) {
//             showError(msg: msg);
//           }
//           // onError: (ErrorType errorType, String msg) {
//           //   showError(msg: msg);
//           // }
//           );
//     } catch (e) {
//       showError(msg: "$e");
//       print(e);
//     }
//   }
//
//   Future<void> checkCompany({bool isCheck = false}) async {
//     removeUnFocusManager();
//
//     sample {
//       if (registerCompanyController.text.isEmpty) {
//         showError(msg: 'Please Enter Company');
//         return;
//       }
//       if(_registerToken == null){
//         await getToken(isCheck: isCheck);
//       }
//       showLoader();
//       errorCompanyName.value = "";
//       await apiService.getRequest(
//           url:
//               "${ApiUrl.checkCompany}?token=$_registerToken&domain=[('name','=','${registerCompanyController.text}')] ",
//           onSuccess: (Map<String, dynamic> data) {
//             dismissLoader();
//
//             checkCompanyData.value =
//                 checkCompanyModelFromJson(jsonEncode(data["response"]));
//             checkCompanyData.refresh();
//             if (checkCompanyData.value.data.isNotEmpty) {
//               if(!isCheck){
//                 showError(msg: "Company is already exist");
//               }
//               errorCompanyName.value = "Company is already exist";
//             }
//           },
//           onError: (ErrorType errorType, String? msg) async {
//             // showError(msg: msg);
//             dismissLoader();
//             if(!isCheck){
//               await checkUser(isCheck: isCheck);
//             }
//           });
//     } catch (e) {
//       print(e);
//       errorCompanyName.value = "$e";
//       showError(msg: "$e");
//     }
//   }
//
//   Future<String?> getToken({bool isCheck = false}) async {
//     removeUnFocusManager();
//     _registerToken = null;
//     sample {
//       showLoader();
//       Map<String, dynamic> params = {};
//       params['login'] = "quantsy@amtiss.com";
//       params['password'] = "1234";
//
//       String query = Uri(queryParameters: params).query;
//       await apiService.getRequest(
//           url: "${ApiUrl.login}?$query",
//           onSuccess: (Map<String, dynamic> data) async {
//             dismissLoader();
//             List<dynamic> userDataList =
//                 userDataModelFromJson(jsonEncode(data["response"]));
//
//             UserDataModelElement userDataModelElement =
//                 UserDataModelElement.fromJson(userDataList[1][0]);
//             _registerToken = userDataModelElement.token;
//             if(!isCheck){
//               await checkCompany();
//             }
//           },
//           onError: (ErrorType errorType, String? msg) {
//             showError(msg: msg);
//           });
//     } catch (e) {
//       showError(msg: "$e");
//     }
//
//     return _registerToken;
//   }
//
//   Future<void> createCompany() async {
//     removeUnFocusManager();
//
//     sample {
//       showLoader();
//       await apiService.getRequest(
//           url:
//               "${ApiUrl.createCompany}?token=$_registerToken&create_vals={'name':'${registerCompanyController.text}'}",
//           onSuccess: (Map<String, dynamic> data) {
//             dismissLoader();
//             createCompanyData.value =
//                 com.createCompanyModelFromJson(jsonEncode(data["response"]));
//             createCompanyData.refresh();
//
//             if (createCompanyData.value.data.isNotEmpty) {
//               createUser(createCompanyModel: createCompanyData.value.data[0]);
//             }
//           },
//           onError: (ErrorType errorType, String? msg) {
//             showError(msg: msg);
//           });
//     } catch (e) {
//       print(e);
//       showError(msg: "$e");
//     }
//   }
//
//   Future<void> checkUser({bool isCheck = false}) async {
//     sample {
//       showLoader();
//       errorUserName.value = "";
//       if(_registerToken == null){
//         await getToken(isCheck: isCheck);
//       }
//       await apiService.getRequest(
//           url:
//               "${ApiUrl.checkUser}?token=$_registerToken&domain=[('name','=','${registerUsernameController.text}')]",
//           onSuccess: (Map<String, dynamic> data) {
//             dismissLoader();
//             if(!isCheck){
//               showError(msg: "User is already exist");
//             }
//             errorUserName.value = "User is already exist";
//           },
//           onError: (ErrorType errorType, String? msg) async {
//             dismissLoader();
//             // showError(msg: msg);
//             if(!isCheck){
//               await createCompany();
//             }
//           });
//     } catch (e) {
//       errorUserName.value = "$e";
//       showError(msg: "$e");
//       log("message   ==>  $e");
//     }
//   }
//
//   Future<void> createUser({required com.Datum createCompanyModel}) async {
//     removeUnFocusManager();
//     sample {
//       showLoader();
//       await apiService.getRequest(
//           url:
//               "${ApiUrl.createUser}?token=$_registerToken&create_vals={'username':'${registerUsernameController.text}','password':'${registerPasswordController.text}','company_id':${createCompanyModel.id}}",
//           onSuccess: (Map<String, dynamic> data) {
//             dismissLoader();
//             createUserData.value =
//                 createUserModelFromJson(jsonEncode(data["response"]));
//
//             createUserData.refresh();
//             Get.back();
//             showSnack(msg: "User successfully Register");
//           },
//           onError: (ErrorType errorType, String? msg) {
//             showError(msg: msg);
//           });
//     } catch (e) {
//       print(e);
//       showError(msg: "$e");
//     }
//   }
//
//   Future<void> createCompanyAndUser() async {
//     if(errorCompanyName.value.isNotEmpty){
//       showError(msg: errorCompanyName.value);
//       return;
//     }
//     if(errorUserName.value.isNotEmpty){
//       showError(msg: errorUserName.value);
//       return;
//     }
//
//     if (registerCompanyController.text.isEmpty) {
//       showError(msg: 'Please Enter Company');
//       return;
//     }
//     if (registerUsernameController.text.isEmpty) {
//       showError(msg: 'Please Enter Username');
//       return;
//     }
//     if (registerPasswordController.text.isEmpty) {
//       showError(msg: 'Please Enter Password');
//       return;
//     }
//     await getToken();
//   }
//
//   void clearFromData() {
//     usernameController.clear();
//     passwordController.clear();
//     registerCompanyController.clear();
//     registerPasswordController.clear();
//     registerUsernameController.clear();
//   }
// }
