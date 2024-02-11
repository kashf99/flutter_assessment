import 'package:flutter/material.dart';
import 'package:flutter_assessment/utils/services/get_places_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:geocoding/geocoding.dart';
import '../views/choose_locations_view.dart';
import '../views/track_route_view.dart';

class SearchPlaceController extends GetxController {
  TextEditingController pickupController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController controller = TextEditingController();
  Rx<LatLng> startLatLng = const LatLng(24.485000, 54.351250).obs;
  Rx<LatLng> endLatLng = const LatLng(24.485000, 54.351250).obs;
  RxString locationAddress = ''.obs;
  RxBool chooseMap = false.obs;
  var uuid = const Uuid().obs;
  RxString sessionToken = '1234567890'.obs;
  RxList<dynamic> placeList = [].obs;


  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      onChanged();
    });
  }
// session token is changed on every changed query
  onChanged() {
    sessionToken.value = uuid.value.v4();
    updatePlaces();
  }
// places api call and polpulating the list
  updatePlaces() async {
    placeList.value = await GetPlacesService.getSuggestion(
        controller.text, sessionToken.value);
  }
// markers are build and updated when user taps on map 
  Set<Marker> buildMarkers(int locationType) {
    Set<Marker> markers = {};
    if (locationType == 0) {
      markers.add(Marker(
          markerId: const MarkerId("startLocation"),
          position: startLatLng.value));
    } else {
      markers.add(Marker(
          markerId: const MarkerId("destination"), position: endLatLng.value));
    }

    return markers;
  }

// update location on the basis of map coordinates
  updateLocation(LatLng location, int locationType) {
    if (locationType == 0) {
      startLatLng.value = location;
      convertCoordinatesToAddress(location, 0);
    } else {
      endLatLng.value = location;
      convertCoordinatesToAddress(location, 1);
    }
  }
// converting latitude, longitude to  string address
  void convertCoordinatesToAddress(LatLng loc, int type) async {
    List<Placemark> locations =
        await placemarkFromCoordinates(loc.latitude, loc.longitude);
    locationAddress.value = "${locations[0].locality} ${locations[0].street}";
    //update addresses separately
    if (type == 0) {
      // 0 for pickup address
      pickupController.text = locationAddress.value;
    } else {
      //  for destination address
      destinationController.text = locationAddress.value;
    }
  }
// latitude and longitude update on the basis of search address
  updateLatLng(String address, LatLng location, int locationType) {
    if (locationType == 0) {
      startLatLng.value = location;
      pickupController.text = address;
    } else {
      endLatLng.value = location;
      destinationController.text = address;
    }
  }
  // actions on completion of search and choosing locations
  nextActions() {
    if (destinationController.text.isEmpty || pickupController.text.isEmpty) {
      chooseMap.value = false;
      Get.to(() => ChooseLocationsView());
      Get.snackbar(
        "Alert",
       "Choose pickup and destination"
          
      );
    } else {
      // screen to track the route
      Get.to(() => TrackRouteView());
    }
  }
}
