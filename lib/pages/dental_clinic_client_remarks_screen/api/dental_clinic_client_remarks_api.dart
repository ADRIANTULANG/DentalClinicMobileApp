import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../configs/endPoints.dart';
import '../model/dental_clinic_client_remarks_model.dart';

class DentalClinicClientRemarksApi {
  static var client = http.Client();
//
  static Future<List<RemarksModel>> getClientRemarks(
      {required String clientID}) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-client-remarks.php'),
        body: {"clientID": clientID.toString()},
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return remarksModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Client Remarks Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Client Remarks Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Client Remarks Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future<bool> createRemarks(
      {required String remarks, required String clinicID}) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-client-remarks.php'),
        body: {
          "remarks": remarks.toString(),
          "clientID": clinicID.toString(),
          "clinicID":
              Get.find<StorageServices>().storage.read('clinicId').toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Add Remarks Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Add Remarks Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Add Remarks Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
