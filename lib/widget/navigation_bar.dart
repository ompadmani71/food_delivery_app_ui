import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kitchen/controller/home_controller.dart';
import 'package:kitchen/utlits/app_constant.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../screen/navigation_screen/dishes.dart';
import '../screen/navigation_screen/home_screen.dart';
import '../screen/navigation_screen/kitchens.dart';
import '../screen/navigation_screen/notification.dart';
import '../screen/navigation_screen/order.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final HomeController _homeController = Get.find();

  @override
  void initState() {
    super.initState();

    _homeController.persistentTabController =
        PersistentTabController(initialIndex: 2);
  }

  List<Widget> _buildScreens() {
    return const [Order(), Notifications(), HomePage(), Dishes(), kitchens()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        // contentPadding: 8,
        onPressed: (context) {
          setState(() {
            _homeController.persistentTabController.index = 0;
          });
        },
        icon: Image.asset(AppImage.order, scale: 30,color: _homeController.persistentTabController.index == 0
            ? Colors.black
            : AppColors.greyIcon),
        title: "Order",
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        activeColorPrimary: AppColors.yellow,
        activeColorSecondary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        onPressed: (context) {
          setState(() {
            _homeController.persistentTabController.index = 1;
          });
        },
        icon: Image.asset(AppImage.notification, scale: 30,color: _homeController.persistentTabController.index == 1
            ? Colors.black
            : AppColors.greyIcon),
        title: "Notification",
        inactiveColorSecondary: AppColors.greyIcon,
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        activeColorPrimary: AppColors.yellow,
        activeColorSecondary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        onPressed: (context) {
          setState(() {
            _homeController.persistentTabController.index = 2;
          });
        },
        icon: Image.asset(AppImage.home, scale: 30,color: _homeController.persistentTabController.index == 2
            ? Colors.black
            : AppColors.greyIcon),
        title: "Home",
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        activeColorPrimary: AppColors.yellow,
        activeColorSecondary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        onPressed: (context) {
          setState(() {
            _homeController.persistentTabController.index = 3;
          });
        },
        icon: Image.asset(AppImage.dish, scale: 30,color: _homeController.persistentTabController.index == 3
        ? Colors.black
            : AppColors.greyIcon),
        title: "Dishes",
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        activeColorPrimary: AppColors.yellow,
        activeColorSecondary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        onPressed: (context) {
          setState(() {
            _homeController.persistentTabController.index = 4;
          });
        },
        icon: Image.asset(AppImage.kitchens,scale: 30,color: _homeController.persistentTabController.index == 4
                ? Colors.black
                : AppColors.greyIcon),
        title: "Kitchens",
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        activeColorPrimary: AppColors.yellow,
        activeColorSecondary: Colors.black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _homeController.persistentTabController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style7,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      ),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 300),
      ),
    );
  }
}
