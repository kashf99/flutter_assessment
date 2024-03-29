import 'package:flutter_assessment/models/trip_summary.dart';
import 'package:flutter_assessment/views/summary_view.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import '../utils/constants.dart';
import 'search_place_controller.dart';

class LocationTrackingController extends GetxController {
  final SearchPlaceController searchPlaceController =
      Get.put(SearchPlaceController());

  Completer<GoogleMapController> mapController = Completer();
  var startLocation = const LatLng(24.485000, 54.351250).obs;
  RxList<LatLng> routePoints = <LatLng>[].obs;
  late TripSummary tripSummary;
  var markers = <Marker>{}.obs;
  late DateTime startTime;
  late DateTime endTime;
  late Timer timer;
  int index = 0;

  @override
  void onInit() {
    super.onInit();
    // initializing location on basis of user selections
    startLocation = searchPlaceController.startLatLng.value.obs;
    // getting the route details
    fetchRoute();
  }

  // ROUTE DETAILS colored route is displayed between start and destination
  void fetchRoute() async {
    PolylinePoints polylinePoints = PolylinePoints();

    // apikey, latitudes and longitudes is passed to get the route
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      AppConstants.apiKey,
      PointLatLng(startLocation.value.latitude, startLocation.value.longitude),
      PointLatLng(searchPlaceController.endLatLng.value.latitude, searchPlaceController.endLatLng.value.longitude),
    );
    // after getting result, routeList in the getx controller is updated
    routePoints.value = result.points
        .map(
          (point) => LatLng(
            point.latitude,
            point.longitude,
          ),
        )
        .toList();
    // showing the movement on the route
    startLocationUpdates();
  }

  // SCHEDULE THE CONTINUOUS LOCATION UPDATES
  void startLocationUpdates() {
    startTime = DateTime.now();
    timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if (index < routePoints.length - 1) {
        index++;
        startLocation.value = routePoints[index];
        updateMarker(index);
      } else {
        timer.cancel();
        endTime = DateTime.now();
        destinationReached();
      }
    });

    return;
  }

  // SHOW THE UPDATED LOCATION OF MARKER ON SCREEN
  void updateMarker(index) {
    markers.clear();
    // start location marker
    markers.add(
      Marker(
        markerId: const MarkerId('start'),
        position: startLocation.value,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    // destination marker
    markers.add(
      Marker(
        markerId: const MarkerId('destination'),
        position: searchPlaceController.endLatLng.value,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );
  }

  // CALCULATE DISTANCE in meters between all points on route
  double calculateDistance(List<LatLng> routePoints) {
    double totalDistance = 0.0;
    for (int i = 0; i < routePoints.length - 1; i++) {
      totalDistance += Geolocator.distanceBetween(
          routePoints[i].latitude,
          routePoints[i].longitude,
          routePoints[i + 1].latitude,
          routePoints[i + 1].longitude);
    }
    return totalDistance;
  }

  // REACHING DESTINATION     // convert to KM
  destinationReached() {
  double  distance = calculateDistance(routePoints) / 1000;

    tripSummary = TripSummary(
        cost: distance * 2,
        destination: searchPlaceController.destinationController.text,
        distance: distance,
        dropOff: searchPlaceController.destinationController.text,
        duration: endTime.difference(startTime),
        endTime: endTime,
        pickup: searchPlaceController.pickupController.text,
        startTime: startTime);
    Get.to(() => SummaryView());
  }
}
