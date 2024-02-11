import 'package:flutter/material.dart';
import 'package:flutter_assessment/views/choose_locations_view.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString usernameError = ''.obs;
  RxString passwordError = ''.obs;

// validation of username / should be email
  void validateUsername(String value) {
    usernameError.value = GetUtils.isEmail(value) ? '' : "invalid username";
  }
// validation of password / length greater than 6
  void validatePassword(String value) {
    passwordError.value = value.length < 6
        ? "invalid password. Must have atleast 6 charachers"
        : '';
  }

// final validation of error and if empty 
  bool _loginValidator() {
    return usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        usernameError.value == '' &&
        passwordError.value == '';
  }

// on validation, go to locations screen
  void login() {
    if (_loginValidator()) {
      Get.off(() => ChooseLocationsView(), transition: Transition.rightToLeft);
    } else {
      Get.snackbar('Error',
          'Invalid email or password. Should be a valid email address and password must have atleast 6 charachters.',
          backgroundColor: Colors.red);
    }
  }
}
