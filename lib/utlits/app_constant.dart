import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImage {
  static const String _basePath = "asset/images";

  static String appLogo = "$_basePath/app_logo.png";
  // static String logo = "$_basePath/logo.png";
  // static String titel = "$_basePath/titel.png";
  static String drawer = "$_basePath/drawer.png";
  static String cart = "$_basePath/cart.png";
  static String filter = "$_basePath/filter.png";
  static String vegetarian = "$_basePath/veg.png";
  static String phone = "$_basePath/phone.png";
  static String mail = "$_basePath/mail.png";
  static String chat = "$_basePath/chat.png";
  static String star = "$_basePath/star.png";
  static String like = "$_basePath/like.png";
  static String order = "$_basePath/Order.png";
  static String notification = "$_basePath/notification.png";
  static String home = "$_basePath/Home.png";
  static String dish = "$_basePath/Dishes.png";
  static String kitchens = "$_basePath/Kitchens.png";

}

class AppColors {


  static Color yellow  = const Color(0xffFAB711);

  static Color greyFont = const Color(0xff545454);
  static Color lightGrey = const Color.fromRGBO(255, 255, 255, 0.5);

  // static Color bgColor = const Color(0xffF5F5F5);


static Color greyIcon = const Color(0xffB3B3B3);
static Color darkGreyIcon = const Color(0xff333333);
static Color lightShadow = const Color(0xff393939);
static Color lightWhite = const Color(0xffF8F8F8);
static Color divider = const Color(0xffF4F4F4);
static Color darkRed = const Color(0xff892B2E);
static Color newRed = const Color(0xffE3163D);
  // static Color textFiledBorder = const Color(0xffC9C9C9);
  // static Color errorText = const Color(0xffE00505);
  // static Color unselectedLabelColor = const Color(0xff666666);
  // static Color divider = const Color(0xffDCDCDC);
  // static Color border = const Color(0xffD7D7D7);
  // static Color purpleDivider = const Color(0xffDCD5F2);
  // static Color shadow = const Color(0xffBDBDBD);
  // static Color red = const Color(0xffD71149);
  // static Color lightFont = const Color(0xffBBBBBB);
  // static Color lightContainer = const Color(0xffEEEEEE);
}

class AppTextStyle{

  static TextStyle f12_w4_cgf = TextStyle(
    fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.greyFont
  );
}