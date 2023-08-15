import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/signin_model.dart';
import '../../../data/providers/user_provider.dart';
import '../../../global_controller.dart/global_controller.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  // * variables
  final formGlobalKey = GlobalKey<FormState>();
  final userNameFieldController = TextEditingController(text: "mor_2314");
  final passwordFieldController = TextEditingController(text: "83r5^_");

  // * observable variables
  final _isRememberChecked = false.obs;
  bool get isRememberChecked => _isRememberChecked.value;
  set isRememberChecked(value) => _isRememberChecked.value = value;

  final _enableIndicator = false.obs;
  bool get enableIndicator => _enableIndicator.value;
  set enableIndicator(value) => _enableIndicator.value = value;

  final _obscurePassword = true.obs;
  bool get obscurePassword => _obscurePassword.value;

  // * methods

  onShowPasswordTap() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    } else if (!GetUtils.isEmail(value)) {
      return null;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    } else if (value.length < 4) {
      return "Password should be 8 or more characters";
    }
    return null;
  }

  onCheckboxChange(bool? value) {
    isRememberChecked = !isRememberChecked;
  }

  final UserProvider _userProvider = UserProvider();

  // * if all field are correct then pass the values to auth controller's _ method.
  validateForm() async {
    if (formGlobalKey.currentState!.validate()) {
      enableIndicator = true;
      final result = await _userProvider.signInCall(
        username: userNameFieldController.text,
        password: passwordFieldController.text,
      );

      if (result is String) {
        Get.find<GlobalGeneralController>().errorSnackbar(
          title: "Error",
          description: result.toString(),
        );
      } else {
        // user data model.
        SignInModel signInModel = result;
        Get.find<GlobalGeneralController>().user = signInModel;
        Get.offNamed(Routes.dashboard);
      }

      enableIndicator = false;
    }
  }

  onNeedHelpTap() {
    // Get.offNamed(Routes.dashboard);
  }

  @override
  void onClose() {
    userNameFieldController.dispose();
    passwordFieldController.dispose();
    super.onClose();
  }
}
