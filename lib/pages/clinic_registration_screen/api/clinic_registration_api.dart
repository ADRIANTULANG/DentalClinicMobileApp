import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dcams/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../configs/endPoints.dart';

class ClinicRegistrationApi {
  static var client = http.Client();
//
  static Future createClinicAccount({
    required String clinic_name,
    required String clinic_username,
    required String clinic_password,
    required String clinic_address,
    required String clinic_lat,
    required String clinic_long,
    required String clinic_image,
    required String clinic_dentist_name,
    required String clinic_email,
    required String clinic_contact_no,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-clinic-account.php'),
        body: {
          "clinic_name": clinic_name,
          "clinic_username": clinic_username,
          "clinic_password": clinic_password,
          "clinic_address": clinic_address,
          "clinic_lat": clinic_lat,
          "clinic_long": clinic_long,
          "clinic_image": clinic_image,
          "clinic_dentist_name": clinic_dentist_name,
          "clinic_email": clinic_email,
          "clinic_contact_no": clinic_contact_no,
          "fcmToken": Get.find<NotificationServices>().token!.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return jsonDecode(response.body)['clinicID'].toString();
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Clinic Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Clinic Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Create Clinic Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future<bool> uploadImage(
      {required String imagename, required String filepath}) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${AppEndpoint.endPointDomain_imageUpload}/image-upload.php'));
    request.fields['name'] = imagename;
    var pic = await http.MultipartFile.fromPath("image", filepath);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future createClinicDocuments({
    required String clinicid,
    required String clinic_document_name,
    required String clinic_document_descritpion,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-clinic-documents.php'),
        body: {
          "clinic_id": clinicid,
          "clinic_img_document": clinic_document_name,
          "clinic_doc_description": clinic_document_descritpion,
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Clinic Documents Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Clinic Documents Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Create Clinic Documents Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
