import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dcams/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../configs/endPoints.dart';

class ClientRegistrationApi {
  static var client = http.Client();
//
  static Future createClientAccount({
    required String name,
    required String username,
    required String password,
    required String address,
    required String contactno,
    required String emailAdd,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-client-account.php'),
        body: {
          "name": name,
          "username": username,
          "password": password,
          "address": address,
          "contactno": contactno,
          "emailAdd": emailAdd,
          "fcmToken": Get.find<NotificationServices>().token!.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Client Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Client Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Create Client Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
