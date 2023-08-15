import 'package:get/get.dart';
import 'package:stc_flutter/routes/app_routes.dart';
import 'package:stc_flutter/screens/details/details_binding.dart';
import 'package:stc_flutter/screens/details/details.dart';

import '../screens/credientials/login_screen/login_binding.dart';
import '../screens/credientials/login_screen/login_screen.dart';
import '../screens/dashboard/dashboard.dart';
import '../screens/dashboard/dashboard_binding.dart';
import '../screens/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initialSplash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => Dashboard(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.detailsScreen,
      page: () => const DetailsScreen(),
      binding: DetailsBinding(),
    ),
  ];
}
