import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kitchen/utlits/app_constant.dart';
import 'package:kitchen/widget/navigation_bar.dart';

import 'controller/home_controller.dart';

void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final UserController _userController = Get.put(UserController());

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.yellow,
              primarySwatch: materialPurpleColor,
              fontFamily: "OpenSans",
            ),
            home: child,
          );
        },
        child: const MyBottomNavigationBar()
    );
  }

  MaterialColor materialPurpleColor = MaterialColor(
    AppColors.yellow.value,
    <int, Color>{
      50: AppColors.yellow,
      100: AppColors.yellow,
      200: AppColors.yellow,
      300: AppColors.yellow,
      400: AppColors.yellow,
      500: AppColors.yellow,
      600: AppColors.yellow,
      700: AppColors.yellow,
      800: AppColors.yellow,
      900: AppColors.yellow,
    },
  );
}
