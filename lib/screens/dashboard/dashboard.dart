import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stc_flutter/core/colors.dart';
import 'package:stc_flutter/screens/dashboard/dashboard_controller.dart';
import '../home/home.dart';

class Dashboard extends GetView<DashboardController> {
  Dashboard({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _iconsAndText = [
    {"text": "Home", "icon": Icons.line_weight},
    {"text": "Cart", "icon": Icons.shopping_cart},
    {"text": "Profile", "icon": Icons.heart_broken_sharp},
    {"text": "Settings", "icon": Icons.person},
  ];

  _builtTabIcon(BuildContext context, int iconIndex) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.pageController.jumpToPage(iconIndex),
        child: controller.page != iconIndex
            ? Icon(
                _iconsAndText[iconIndex]["icon"],
                size: 30.h,
                color: Colors.grey,
              )
            : Icon(
                _iconsAndText[iconIndex]["icon"],
                color: primary,
                size: 35.h,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          children: const [
            HomeScreen(),
            Center(child: Text("2")),
            Center(child: Text("3")),
            Center(child: Text("4")),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 20,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomAppBar(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 8.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _builtTabIcon(context, 0),
                  _builtTabIcon(context, 1),
                  _builtTabIcon(context, 2),
                  _builtTabIcon(context, 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
