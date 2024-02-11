import 'package:flutter/material.dart';
import 'package:flutter_assessment/utils/constants.dart';
import 'package:flutter_assessment/utils/widgets/custom_action_button.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../utils/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.sizeOf(context).width;
    double screenheight = MediaQuery.sizeOf(context).height;
// email and password is required to login.
// email must contain '@' and password must have atleast 6 charachters
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: Container(
        width: screenwidth,
        height: screenheight / 1.1,
        padding: const EdgeInsets.all(35.0),
        margin: EdgeInsets.only(top: screenheight / 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(32), topLeft: Radius.circular(32)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppConstants.darkBlueColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
              // vertical space added 
              AppConstants.vSpaceLarge(screenheight * 2),

              // textfield to input username
              Obx(
                () => CustomTextField(
                  hintText: "Username",
                  icon: const Icon(Icons.person),
                  error: loginController.usernameError.value,
                  onChanged: (v) {
                    loginController.validateUsername(
                        loginController.usernameController.text);
                  },
                  controller: loginController.usernameController,
                ),
              ),

               // textfield to input password
              Obx(
                () => CustomTextField(
                  hintText: "Password",
                  isPassword: true,
                  onChanged: (v) {
                    loginController.validatePassword(
                        loginController.passwordController.text);
                  },
                  error: loginController.passwordError.value,
                  icon: const Icon(Icons.lock_open_rounded),
                  controller: loginController.passwordController,
                ),
              ),
              
              // vertical space 
              AppConstants.vSpaceLarge(screenheight * 2),

              // button to proceed for login  checks validations
              CustomActionButton(
                  onTap: () {
                    loginController.login();
                  },
                  text: "Login"),
            ],
          ),
        ),
      ),
    );
  }
}
