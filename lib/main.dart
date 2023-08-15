import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stc_flutter/routes/app_pages.dart';
import 'package:stc_flutter/routes/app_routes.dart';
import 'package:stc_flutter/screens/splash/splash_screen_binding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ScreenUtilInit(
      designSize: Size(size.width, size.height),
      builder: (ctx, _) => GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2AB3C6)),
          appBarTheme: const AppBarTheme(color: Color(0xFF2AB3C6)),
        ),
        title: 'STC Task',
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        initialRoute: Routes.initialSplash,
        initialBinding: SplashBinding(),
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
