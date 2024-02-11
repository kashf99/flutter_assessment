import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/views/choose_locations_view.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
// this class gets the places from google maps api

class GetPlacesService {
  static getSuggestion(String input, sessionToken) async {
    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';

      String request =
          '$baseURL?input=$input&key=${AppConstants.apiKey}&sessiontoken=$sessionToken';
      // sending get request to get the places based on query
      var response = await http.get(Uri.parse(request));

      // if status code is 200, then api call is successful
      // and data is retrieved
      if (response.statusCode == 200) {
        // decoding the response from api
        return json.decode(response.body)['predictions'];
      } else {
        // here exception is thrown if there is some issue
        // during api call
        throw Exception('Failed to load places');
      }
    } catch (e) {
     
       Get.to(()=> ChooseLocationsView());
       // error message shown to user in case of any error
      Get.snackbar('Error',
          'Something went wrong. Plaese check your internet connection or try again later',
          backgroundColor: Colors.red);
    }
  }

  static convertPlaceIdToCoordinates(placeId) async {
    String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry&key=${AppConstants.apiKey}';
    try {
      // api call is being sent based on above query
      var response = await http.get(Uri.parse(url));

      // if successful response
      if (response.statusCode == 200) {
          // decoding the response from api to convert to dart objects
        var data = json.decode(response.body);
        return LatLng(
          data['result']['geometry']['location']['lat'],
          data['result']['geometry']['location']['lng'],
        );
      } else {
          // here exception is thrown if there is some issue
        // during api call
        throw Exception('Failed to get coordinates');
      }
    } catch (e) {
    Get.to(()=> ChooseLocationsView());
      // error message shown to user in case of any error
      Get.snackbar('Error',
          'Something went wrong. Plaese check your internet connection or try again later',
          backgroundColor: Colors.red);
    }
  }
}
