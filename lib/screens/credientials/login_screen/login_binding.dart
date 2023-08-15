import 'package:get/instance_manager.dart';
import 'package:stc_flutter/screens/credientials/login_screen/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
