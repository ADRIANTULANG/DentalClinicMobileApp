import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../configs/endPoints.dart';

class ClinicBookingTransactionApi {
  static var client = http.Client();
//
  static Future<bool> create_reservation({
    required String res_service_name,
    required String res_clinic_id,
    required String res_service_price,
    required String res_fee,
    required String res_total_amount,
    required String res_schedule,
    required String res_payment_gateway,
    required String res_client_id,
    required String res_schedule_time,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-reservation.php'),
        body: {
          "res_service_name": res_service_name.toString(),
          "res_clinic_id": res_clinic_id.toString(),
          "res_service_price": res_service_price.toString(),
          "res_fee": res_fee.toString(),
          "res_total_amount": res_total_amount.toString(),
          "res_schedule": res_schedule.toString(),
          "res_payment_gateway": res_payment_gateway.toString(),
          "res_client_id": res_client_id.trim().toString(),
          "res_schedule_time": res_schedule_time.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        // return clinicServicesModelFromJson(
        //     jsonEncode(jsonDecode(response.body)['data']));
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Nearest Clinic Services Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Nearest Clinic Services Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Nearest Clinic Services Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
