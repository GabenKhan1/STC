import 'dart:async';

import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // * wait for 2 seconds and then move to next screen.
    Timer(
      const Duration(seconds: 2),
      () {
        Get.offNamed(Routes.loginScreen);
        Get.delete<SplashController>();
      },
    );

    super.onInit();
  }
}
