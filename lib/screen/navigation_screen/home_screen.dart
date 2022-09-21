import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen/widget/card_list.dart';
import '../../utlits/app_constant.dart';
import '../../widget/toggle_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TextEditingController searchController = TextEditingController();

  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        // bottomNavigationBar: MyBottomNavigationBar(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  right: 18.w, left: 18.w, top: 25.h, bottom: 18.h),
              decoration: BoxDecoration(
                  color: AppColors.yellow.withOpacity(0.16),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(32.r))),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImage.drawer, scale: 22),
                      SizedBox(width: 15.w),
                      Image.asset(AppImage.appLogo, scale: 6),
                      const Spacer(),
                      Image.asset(AppImage.cart, scale: 23),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Container(
                      height: 35.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white.withOpacity(0.5)),
                      child: ToggleButtons(
                        isSelected: isSelected,
                        renderBorder: false,
                        splashColor: Colors.transparent,
                        fillColor: AppColors.yellow,
                        // disabledColor: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                        constraints:
                            BoxConstraints(maxHeight: 37.h, maxWidth: 100.w),
                        children: [
                          ToggleButton(
                              isSelected: isSelected[0], text: "Recipes"),
                          ToggleButton(
                              isSelected: isSelected[1], text: "My Kitchens"),
                          ToggleButton(
                              isSelected: isSelected[2], text: "Workout"),
                        ],
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < isSelected.length; i++) {
                              if (i == index) {
                                isSelected[i] = true;
                              } else {
                                isSelected[i] = false;
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "Enter Kitchen type/Dish Name",
                              hintStyle: TextStyle(color: AppColors.greyIcon),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.5),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8.r)),
                        padding: EdgeInsets.all(12.w),
                        child: Image.asset(AppImage.filter,
                            scale: 23, color: AppColors.darkGreyIcon),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(top: 20.h),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return cardList();
                  }),
            )
          ],
        ));
  }
}
