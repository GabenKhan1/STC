import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stc_flutter/screens/splash/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "STC APP",
              style: TextStyle(
                  color: Color(0xFF2AB3C6),
                  fontSize: 64,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
