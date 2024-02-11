import 'package:flutter/material.dart';

import '../constants.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.sizeOf(context).width;
    double screenheight = MediaQuery.sizeOf(context).height;

    return GestureDetector(
      // action that is to be performed on this button
      onTap: onTap,

      child: Container(
        padding:
            EdgeInsets.only(top: screenheight / 80, bottom: screenheight / 80),
        decoration: BoxDecoration(
          color: AppConstants.backgroundColor,
          borderRadius: BorderRadius.circular(screenwidth / 50),
        ),
        width: screenwidth / 1.2,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
