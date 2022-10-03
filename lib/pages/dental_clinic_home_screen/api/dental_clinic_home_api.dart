import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dcams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../configs/endPoints.dart';
import '../model/dental_clinic_model.dart';

class DentalClinicAppointmentsApi {
  static var client = http.Client();
//
  static Future<List<DentalClinicAppointmentsModle>>
      getClinicAppointments() async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-clinic-appointments.php'),
        body: {
          "clinicID":
              Get.find<StorageServices>().storage.read('clinicId').toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return dentalClinicAppointmentsModleFromJson(
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

  static Future updateAppointment({
    required String resID,
    required String remarks,
    required String status,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/update-appointment.php'),
        body: {
          "resID": resID,
          "remarks": remarks,
          "status": status,
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Update Appointments Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Appointments Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Update Appointments Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future getSubscritpionStatus() async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/get-clinic-subscription-status.php'),
        body: {
          "clinicID":
              Get.find<StorageServices>().storage.read('clinicId').toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        // return true;
        return jsonDecode(response.body)['data'][0]['subscription_status'];
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Subscription Status Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Subscription Status Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Subscription Status Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

//
  static Future<List<ClinicSubscriptionDates>>
      getClinicSubscriptionDates() async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/get-clinic-subscription-status-dates.php'),
        body: {
          "clinicID":
              Get.find<StorageServices>().storage.read('clinicId').toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return clinicSubscriptionDatesFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Clinic Dates Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Clinic Dates Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      print(e);
      Get.snackbar(
        "Get Clinic Dates Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }

  static Future updateClinicStatusToExpired() async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/update-clinic-subscription-status-to-expired.php'),
        body: {
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
        "Update Clinic to Expired Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Update Clinic to Expired Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Update Clinic to Expired Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return true;
    }
  }

  static Future sendNotification({
    required String userToken,
    required String service,
    required String date,
    required String time,
    required String clinic,
  }) async {
    var e2epushnotif = await http.post(
        Uri.parse('${AppEndpoint.endPointDomain}/push-notification.php'),
        body: {
          "fcmtoken": userToken,
          "title": "Message",
          "body": "RESERVATION APPROVED  $clinic - $service - $date - $time"
        });
    print("e2e notif: ${e2epushnotif.body}");

    // var mynotif = await http.post(
    //     Uri.parse('${AppEndpoint.endPointDomain}/push-notification-other.php'),
    //     body: {
    //       "fcmtoken": userToken,
    //       "title": "my notif title",
    //       "body": "my notif body"
    //     });
    // print("mynotif: ${mynotif.body}");
  }
}
