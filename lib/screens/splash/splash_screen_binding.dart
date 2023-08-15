import 'package:get/get.dart';
import 'package:stc_flutter/screens/splash/splash_screen_controller.dart';

import '../../global_controller.dart/global_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    // * this controller contains all the global methods that will be use throughout the app.
    Get.put<GlobalGeneralController>(GlobalGeneralController());
  }
}
