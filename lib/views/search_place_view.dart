import 'package:flutter/material.dart';
import 'package:flutter_assessment/controllers/search_place_controller.dart';
import 'package:flutter_assessment/utils/widgets/choose_on_map.dart';
import 'package:get/get.dart';

import '../utils/widgets/search_by_text.dart';

class SearchPlaceView extends StatelessWidget {
  SearchPlaceView({super.key, required this.locationType});
  final int locationType;
  final SearchPlaceController searchPlaceController =
      Get.put(SearchPlaceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          locationType == 0 ? 'Select Pickup Location' : 'Select Destination',
     style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // first search field is shown to select location and 
              // if  "Choose on map" is selected, map gets opened
              // where location can be chosen
              Obx(
                () => searchPlaceController.chooseMap.value
                    ? ChooseOnMap(
                        locationType: locationType,
                      )
                    : SearchByText(locationType: locationType,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
