import 'package:flutter/material.dart';
import 'package:flutter_assessment/utils/widgets/custom_action_button.dart';
import 'package:flutter_assessment/views/search_place_view.dart';
import 'package:get/get.dart';
import '../controllers/search_place_controller.dart';
import '../utils/constants.dart';
import '../utils/widgets/custom_text_field.dart';

class ChooseLocationsView extends StatelessWidget {
  ChooseLocationsView({super.key});
  final SearchPlaceController searchPlaceController =
      Get.put(SearchPlaceController());
// screen to choose the pickup location and destination
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.sizeOf(context).height;
    double screenwidth = MediaQuery.sizeOf(context).width;

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
                "Choose Locations",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppConstants.darkBlueColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),

              // vertical space
              AppConstants.vSpaceLarge(screenheight * 2),

              // choose pickup location
              CustomTextField(
                onTap: () {
                  Get.to(() => SearchPlaceView(locationType: 0));
                },
                controller: searchPlaceController.pickupController,
                hintText: "Choose Pickup",
                icon: const Icon(Icons.map),
                suffixIcon: Icon(Icons.arrow_forward_ios_rounded,
                    color: AppConstants.darkBlueColor),
              ),

              //choose destination location
              CustomTextField(
                onTap: () {
                  searchPlaceController.pickupController.text;
                  Get.to(() => SearchPlaceView(locationType: 1));
                },
                controller: searchPlaceController.destinationController,
                hintText: 'Choose Destination',
                icon: const Icon(Icons.map),
                suffixIcon: Icon(Icons.arrow_forward_ios_rounded,
                    color: AppConstants.darkBlueColor),
              ),

              // vertical space
              AppConstants.vSpaceLarge(screenheight * 2),

              // action button to continue to route tracking
              CustomActionButton(
                onTap: () {
                  searchPlaceController.nextActions();
                },
                text: "Continue",
              )
            ],
          ),
        ),
      ),
    );
  }
}
