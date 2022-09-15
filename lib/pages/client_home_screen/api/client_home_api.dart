import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dcams/services/location_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../configs/endPoints.dart';
import '../model/client_home_model.dart';

class ClientHomeApi {
  static var client = http.Client();
//
  static Future<List<ClientHomeModel>> getClinicNearest(
      {required String distanceInKilometers}) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-clinic-with-distance.php'),
        body: {
          "lat": Get.find<LocationServices>().user_latitude.toString(),
          "long": Get.find<LocationServices>().user_longitude.toString(),
          "distance": distanceInKilometers.toString()
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return clientHomeModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Nearest Clinic Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Nearest Clinic Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Nearest Clinic Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }
}
