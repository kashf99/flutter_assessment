import 'package:flutter/material.dart';

class AppConstants {
  static Color backgroundColor = const Color.fromARGB(255, 76, 208, 244);
  static Color darkBlueColor = const Color.fromARGB(255, 1, 192, 245);
  static String apiKey = 'AIzaSyD3_7zlUNf0Fch9VApwm65FXRR59s8KSFg';
  static SizedBox vSpaceLarge(double screenheight) {
    return SizedBox(
      height: screenheight / 35,
    );
  }

  static SizedBox vSpaceSmall(double screenheight) {
    return SizedBox(
      height: screenheight / 85,
    );
  }

  static SizedBox hSpaceLarge(double screenwidth) {
    return SizedBox(
      width: screenwidth / 15,
    );
  }

  static SizedBox hSpaceSmall(double screenwidth) {
    return SizedBox(
      width: screenwidth / 25,
    );
  }
}
