import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stc_flutter/screens/credientials/login_screen/login_controller.dart';

import '../../../core/colors.dart';
import '../../../core/style.dart';
import '../../../global_widgets/text_field.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: controller.formGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [secondry, primary])),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          "STC \n HEALTH",
                          textAlign: TextAlign.center,
                          style: headingStyle.copyWith(
                              fontSize: 32,
                              color: white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Positioned(
                        left: 15,
                        bottom: 15,
                        child: Text(
                          "Log In",
                          textAlign: TextAlign.start,
                          style: headingStyle.copyWith(
                            color: white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      CustomTextFieldWidget(
                        labelText: "Email",
                        textEditingController:
                            controller.userNameFieldController,
                        validator: controller.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: Icon(
                          Icons.check_circle_outline,
                          color: primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => CustomTextFieldWidget(
                          labelText: "Password",
                          textEditingController:
                              controller.passwordFieldController,
                          obscureText: controller.obscurePassword,
                          validator: controller.validatePassword,
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            onPressed: controller.onShowPasswordTap,
                            icon: Icon(
                              controller.obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: controller.obscurePassword
                                  ? Colors.grey
                                  : primary,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),
                      // * these widgets will only be painted if the condition will be true.
                      Obx(
                        () => Center(
                          child: controller.enableIndicator
                              ? const Padding(
                                  padding: EdgeInsets.only(bottom: 40),
                                  child: CircularProgressIndicator(),
                                )
                              : null,
                        ),
                      ),
                      Obx(
                        () => SizedBox(
                          height: 70.h,
                          width: MediaQuery.sizeOf(context).width * 0.84,
                          child: FilledButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(primary)),
                            onPressed: controller.enableIndicator
                                ? null
                                : controller.validateForm,
                            child: const Text(
                              "Continue",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: controller.onNeedHelpTap,
                            child: Text(
                              "NEED HELP?",
                              style: headingStyle.copyWith(
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
