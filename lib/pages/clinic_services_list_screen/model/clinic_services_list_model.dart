import 'dart:convert';

import 'package:get/get.dart';

List<ClinicServicesModel> clinicServicesModelFromJson(String str) =>
    List<ClinicServicesModel>.from(
        json.decode(str).map((x) => ClinicServicesModel.fromJson(x)));

String clinicServicesModelToJson(List<ClinicServicesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicServicesModel {
  ClinicServicesModel({
    required this.servicesId,
    required this.servicesName,
    required this.servicesClinicId,
    required this.servicesPrice,
    required this.servicesDescription,
    required this.servicesStatus,
    required this.servicesCheckbox,
  });

  String servicesId;
  String servicesName;
  String servicesClinicId;
  String servicesPrice;
  String servicesDescription;
  String servicesStatus;
  RxBool servicesCheckbox;

  factory ClinicServicesModel.fromJson(Map<String, dynamic> json) =>
      ClinicServicesModel(
        servicesId: json["services_id"],
        servicesName: json["services_name"],
        servicesClinicId: json["services_clinic_id"],
        servicesPrice: json["services_price"],
        servicesDescription: json["services_description"],
        servicesStatus: json["services_status"],
        servicesCheckbox: false.obs,
      );

  Map<String, dynamic> toJson() => {
        "services_id": servicesId,
        "services_name": servicesName,
        "services_clinic_id": servicesClinicId,
        "services_price": servicesPrice,
        "services_description": servicesDescription,
        "services_status": servicesStatus,
        "servicesCheckbox": servicesCheckbox,
      };
}
