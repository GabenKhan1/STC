import 'package:get/get.dart';
import 'package:stc_flutter/screens/dashboard/dashboard_controller.dart';

import '../home/home_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());

    //* Initialize all the dashboard's widgets/screens controllers here, bacause we will navigate to each screen with the help of PageView, that's why we will not use the routes ways.
    //? So the question becomes, when will we initialize the controller of dashboard's screens/widgets?
    //* because if we initialize when screen will created, then we will not be able to extends GetView<Controller>, and that way we could not follow the proper getx_pattern.
    //* The best place to initialize all the pageview's screens controller is this.
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
