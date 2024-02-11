import 'package:flutter/material.dart';
import 'package:flutter_assessment/controllers/search_place_controller.dart';
import 'package:flutter_assessment/utils/widgets/custom_action_button.dart';
import 'package:flutter_assessment/views/choose_locations_view.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants.dart';

class ChooseOnMap extends StatelessWidget {
  ChooseOnMap({super.key, required this.locationType});
  final int locationType;
  final SearchPlaceController searchPlaceController =
      Get.put(SearchPlaceController());
// this is the map widget where user taps on the map
// and marker is being shown at that point
// this point is then updated in getx controller
// either for destination location (locationType 1)
// or pickup location (locationtype 2)
//
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.sizeOf(context).height;
    double screenwidth = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: screenheight / 1.5,
          width: screenwidth / 1.1,
          child: Obx(
            () => GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(24.485000, 54.351250),
                zoom: 14.5,
              ),
              // here location is selected on tap
              onTap: (LatLng location) {
                searchPlaceController.updateLocation(location, locationType);
              },
              markers: searchPlaceController.buildMarkers(locationType),
            ),
          ),
        ),

        // vertical space
        AppConstants.vSpaceSmall(screenheight),

        // location address is shown based on user selection
        Obx(
          () => Text(
            searchPlaceController.locationAddress.value,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 10),
          ),
        ),

        // vertical space
        AppConstants.vSpaceSmall(screenheight),

        // action button after location selection
        // going to the screen for location review
        CustomActionButton(
            onTap: () {
              Get.to(() => ChooseLocationsView());
            },
            text: "Next"),
      ],
    );
  }
}
