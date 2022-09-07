import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../configs/endPoints.dart';
import '../model/client_appointments_model.dart';

class ClientAppointmentsApi {
  static var client = http.Client();
//
  static Future<List<ClientAppointmentModel>> getAppointments() async {
    print(Get.find<StorageServices>().storage.read('clientId').toString());
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-appointments.php'),
        body: {
          "clientID":
              Get.find<StorageServices>().storage.read('clientId').toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return clientAppointmentModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Appointments Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Appointments Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Appointments Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }
}
