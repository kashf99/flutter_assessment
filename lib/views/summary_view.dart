import 'package:flutter/material.dart';
import 'package:flutter_assessment/utils/widgets/summary_tile.dart';
import 'package:flutter_assessment/views/choose_locations_view.dart';
import 'package:get/get.dart';
import '../controllers/track_route_controller.dart';
import '../utils/constants.dart';
import '../utils/widgets/custom_action_button.dart';

class SummaryView extends StatelessWidget {
  SummaryView({super.key});
  final LocationTrackingController locationTrackingController =
      Get.put(LocationTrackingController());

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.sizeOf(context).width;
    double screenheight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: Container(
        width: screenwidth,
        height: screenheight / 1.1,
        padding: const EdgeInsets.all(20.0),
        margin: EdgeInsets.only(top: screenheight / 10),
        decoration: const BoxDecoration(
          //  color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 1, 111, 128),
                Color.fromARGB(255, 3, 3, 3),
              ]),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(32), topLeft: Radius.circular(32)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Trip Summary",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24),
              ),
              // vertical space added
              AppConstants.vSpaceLarge(screenheight * 2),
              SummaryTile(
                title: "Pickup",
                iconData: Icons.location_on_outlined,
                value: locationTrackingController.tripSummary.pickup,
              ),
              SummaryTile(
                title: "Dropoff",
                iconData: Icons.location_pin,
                value: locationTrackingController.tripSummary.dropOff,
              ),

              SummaryTile(
                title: "Destination",
                iconData: Icons.my_location_sharp,
                value: locationTrackingController.tripSummary.destination,
              ),
              SummaryTile(
                title: "Start Time",
                iconData: Icons.timer_outlined,
                value:
                    locationTrackingController.tripSummary.startTime.toString(),
              ),
              SummaryTile(
                title: "End Time",
                iconData: Icons.timer_rounded,
                value:
                    locationTrackingController.tripSummary.endTime.toString(),
              ),
              SummaryTile(
                title: "Distance (KM)",
                iconData: Icons.social_distance,
                value:
                    locationTrackingController.tripSummary.distance.toString(),
              ),
              SummaryTile(
                title: "Duration",
                iconData: Icons.timelapse_rounded,
                value:
                    locationTrackingController.tripSummary.duration.toString(),
              ),
              SummaryTile(
                title: "Cost (AED)",
                iconData: Icons.money,
                value: locationTrackingController.tripSummary.cost.toString(),
              ),

              // vertical space
              AppConstants.vSpaceLarge(screenheight * 2),

              // button to close
              CustomActionButton(
                  onTap: () {
                    Get.to(() => ChooseLocationsView());
                  },
                  text: "Close"),
            ],
          ),
        ),
      ),
    );
  }
}
