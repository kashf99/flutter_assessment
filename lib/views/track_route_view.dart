import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/track_route_controller.dart';

class TrackRouteView extends StatelessWidget {
  TrackRouteView({super.key});

  final LocationTrackingController controller =
      Get.put(LocationTrackingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  const Text('Track Route',    style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),),
      ),
      body: Obx(
        () => GoogleMap(
          //camera position on start
          initialCameraPosition: CameraPosition(
            target: controller.startLocation.value,
            zoom: 14.5,
          ),
          onMapCreated: (con){
con.moveCamera(CameraUpdate.newCameraPosition(
  
        CameraPosition(
          zoom: 13,
          target: LatLng(
          controller.  startLocation.value.latitude,
          controller.  startLocation.value.longitude,
          ),
        ),
      ),);

          },
          markers: controller.markers,
          polylines: {
            //showing the route
            Polyline(
              polylineId: const PolylineId("route"),
              points: controller.routePoints,
              color: Colors.black,
              width: 8,
            ),
          },
          
          
        ),
      ),
    );
  }
}
