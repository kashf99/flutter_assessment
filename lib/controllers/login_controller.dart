import 'package:flutter/material.dart';
import 'package:flutter_assessment/views/choose_locations_view.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString usernameError = ''.obs;
  RxString passwordError = ''.obs;

// validation of username / should be email
  void validateUsername() {
    usernameError.value = GetUtils.isEmail(usernameController.text) ? '' : "invalid username";
  }
// validation of password / length greater than 6
  void validatePassword() {
    passwordError.value = passwordController.text.length < 6
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
      if(usernameController.text=="track@gmail.com" && passwordController.text=="12345678"){
   Get.off(() => ChooseLocationsView(), transition: Transition.rightToLeft);
   
      }else{
        Get.snackbar('User Not Found',
          'Login with correct user credentials. Hint: track@*****.*** and ******78',
          backgroundColor: Colors.red);
      }
    } else {
      Get.snackbar('Error',
          'Invalid email or password. Should be a valid email address and password must have atleast 6 charachters.',
          backgroundColor: Colors.red);
    }
  }
}
