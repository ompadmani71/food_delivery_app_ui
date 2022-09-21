import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utlits/app_constant.dart';

Widget cardList() {
  return Container(
    margin: EdgeInsets.only(right: 15.w, left: 15.w, bottom: 20.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightShadow.withOpacity(0.1),
            offset: const Offset(0, 30),
            blurRadius: 30,
          )
        ]),
    child: Column(
      children: [
        Container(
          height: 130.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              image: const DecorationImage(
                  image: AssetImage("asset/sample/sample.jpg"), fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(6.w),
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(25.r))),
                    child: Row(
                      children: [
                        Image.asset(AppImage.star, scale: 35),
                        Text.rich(TextSpan(
                            text: "  4.5",
                            style: TextStyle(
                                fontSize: 10.sp, color: AppColors.darkRed),
                            children: <InlineSpan>[
                              TextSpan(
                                  text: "(450 review)",
                                  style: TextStyle(
                                      color: AppColors.greyFont,
                                      fontWeight: FontWeight.w500))
                            ])),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.only(right: 15.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.4),
                        image: DecorationImage(
                            image: AssetImage(AppImage.like), scale: 23)),
                  )
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.newRed,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Text(
                  "NEW",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(AppImage.vegetarian, scale: 20),
                  SizedBox(width: 8.w),
                  Text(
                    "The 4 Cheese Pizza",
                    style: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    "₹599",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.yellow),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h),
                child: Row(
                  children: [
                    Text("8502 Preston Road, Inglewood, Maine 98380",
                        style: AppTextStyle.f12_w4_cgf)
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.watch_later_outlined, color: AppColors.greyFont),
                  SizedBox(width: 5.w),
                  Text("8am - 10pm", style: AppTextStyle.f12_w4_cgf),
                  const Spacer(),
                  customButton(image: AppImage.phone),
                  customButton(image: AppImage.mail),
                  customButton(image: AppImage.chat),
                ],
              ),
              Divider(color: AppColors.divider, thickness: 1.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Quick Look",
                        style: TextStyle(color: AppColors.yellow),
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.yellow.withOpacity(0.16),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory),
                      child: Text(
                        "Orders",
                        style: TextStyle(color: AppColors.yellow),
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory),
                      child: const Text(
                        "Menu",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      )),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget customButton({required String image}) {
  return Container(
// width: 32.w,
// height: 32.w,
    alignment: Alignment.center,
    margin: EdgeInsets.only(left: 8.w),
    padding: EdgeInsets.all(18.w),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.lightWhite,
      image: DecorationImage(image: AssetImage(image), scale: 25),
    ),
  );
}
