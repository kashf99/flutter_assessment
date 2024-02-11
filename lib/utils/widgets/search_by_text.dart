import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/search_place_controller.dart';
import '../../views/choose_locations_view.dart';
import '../constants.dart';
import '../services/get_places_service.dart';
import 'custom_text_field.dart';

class SearchByText extends StatelessWidget {
  SearchByText({super.key, required this.locationType});
  final int locationType;
  final SearchPlaceController searchPlaceController =
      Get.put(SearchPlaceController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //field to search locations based on text query
        Align(
          alignment: Alignment.topCenter,
          child: CustomTextField(
            controller: searchPlaceController.controller,
            hintText: "Search your location here",
            icon: const Icon(Icons.map),
            suffixIcon: IconButton(
              icon: Icon(Icons.cancel, color: AppConstants.darkBlueColor),
              onPressed: () {
                searchPlaceController.controller.clear();
              },
            ),
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                // if true, map will be displayed to choose location
                searchPlaceController.chooseMap.value = true;
              },
              child: Text(
                "Choose on map",
                style: TextStyle(color: AppConstants.darkBlueColor),
              ),
            )),

            // list of availabe places based on search query
        Obx(
          () => ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: searchPlaceController.placeList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  // first latitude and longitude is fetched
                  // based upon the place id 
                  // then are passed further to update in getx controller
                  // description is updated in search field
                  // locationType serves as id, 0 for pickup location
                  // 1 for destination location
                  searchPlaceController.updateLatLng(
                      searchPlaceController.placeList[index]["description"],
                      await GetPlacesService.convertPlaceIdToCoordinates(
                          searchPlaceController.placeList[index]["place_id"]),
                      locationType);
                    Get.to(()=>ChooseLocationsView());
                },
                // place description is being shown in the listview
                child: ListTile(
                  title: Text(
                      searchPlaceController.placeList[index]["description"]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
