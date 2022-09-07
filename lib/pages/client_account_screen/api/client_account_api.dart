import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../configs/endPoints.dart';

class ClientAccountApi {
  static var client = http.Client();
// <List<ClientHomeModel>>
  static Future updateClientAccount({
    required String clientID,
    required String name,
    required String username,
    required String password,
    required String address,
    required String contactno,
    required String emailAdd,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/update-client-account.php'),
        body: {
          "clientID": clientID,
          "name": name,
          "username": username,
          "password": password,
          "address": address,
          "contactno": contactno,
          "emailAdd": emailAdd,
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Update Account Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Account Clinic Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Update Account Clinic Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
