import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../configs/endPoints.dart';
import '../model/login_model.dart';

class LoginApi {
  static var client = http.Client();
//
  static Future<List<LoginModel>> Futurelogin({
    required String username,
    required String password,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/login.php'),
        body: {
          "username": username.toString(),
          "password": password.toString(),
        },
      );
      // print(response.body);
      if (jsonDecode(response.body)['message'] == "Success") {
        return loginModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "login Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "login Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "login Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

//
  static Future<List<ClinicModel>> getClinicDetails({
    required String clinicID,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-clinic-details.php'),
        body: {
          "clinicID": clinicID.toString(),
        },
      );
      // print(response.body);
      if (jsonDecode(response.body)['message'] == "Success") {
        return clinicModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Clinic Details Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Clinic Details Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Clinic Details Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

// <List<ClientModel>>
  static Future<List<ClientModel>> getClientDetails({
    required String clientID,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-client-details.php'),
        body: {
          "clientID": clientID.toString(),
        },
      );
      // print(response.body);
      if (jsonDecode(response.body)['message'] == "Success") {
        return clientModelFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Client Details  Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Client Details Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Client Details  Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future updateClientFCMtoken({
    required String clientID,
    required String fcmToken,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/update-client-fcm-token.php'),
        body: {
          "clientID": clientID.toString(),
          "fcmToken": fcmToken.toString(),
        },
      );
      // print(response.body);
      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Update Client FCM token Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Client FCM token Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Update Client FCM token Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future updateClinicFCMtoken({
    required String clinicID,
    required String fcmToken,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/update-clinic-fcm-token.php'),
        body: {
          "clinicID": clinicID.toString(),
          "fcmToken": fcmToken.toString(),
        },
      );
      // print(response.body);
      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Update Clinic FCM token Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Clinic FCM token Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Update Clinic FCM token Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
