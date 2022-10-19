import 'dart:convert';

import 'package:get/get.dart';

List<DentalWalkInModel> DentalWalkInModelFromJson(String str) =>
    List<DentalWalkInModel>.from(
        json.decode(str).map((x) => DentalWalkInModel.fromJson(x)));

String DentalWalkInModelToJson(List<DentalWalkInModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DentalWalkInModel {
  DentalWalkInModel({
    required this.servicesId,
    required this.servicesName,
    required this.servicesClinicId,
    required this.servicesPrice,
    required this.servicesDescription,
    required this.servicesStatus,
  });

  String servicesId;
  RxString servicesName;
  String servicesClinicId;
  String servicesPrice;
  String servicesDescription;
  String servicesStatus;

  factory DentalWalkInModel.fromJson(Map<String, dynamic> json) =>
      DentalWalkInModel(
        servicesId: json["services_id"],
        servicesName: json["services_name"].toString().obs,
        servicesClinicId: json["services_clinic_id"],
        servicesPrice: json["services_price"],
        servicesDescription: json["services_description"],
        servicesStatus: json["services_status"],
      );

  Map<String, dynamic> toJson() => {
        "services_id": servicesId,
        "services_name": servicesName,
        "services_clinic_id": servicesClinicId,
        "services_price": servicesPrice,
        "services_description": servicesDescription,
        "services_status": servicesStatus,
      };
}

List<WalkinListModel> walkinListModelFromJson(String str) =>
    List<WalkinListModel>.from(
        json.decode(str).map((x) => WalkinListModel.fromJson(x)));

String walkinListModelToJson(List<WalkinListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WalkinListModel {
  WalkinListModel({
    required this.walkInId,
    required this.patientName,
    required this.serviceName,
    required this.servicePrice,
    required this.clinicId,
    required this.clinicName,
    required this.date,
    required this.time,
    required this.contactno,
    required this.email,
    required this.address,
  });

  String walkInId;
  String patientName;
  String serviceName;
  String servicePrice;
  String clinicId;
  String clinicName;
  DateTime date;
  String time;
  String contactno;
  String email;
  String address;

  factory WalkinListModel.fromJson(Map<String, dynamic> json) =>
      WalkinListModel(
        walkInId: json["walk_in_id"],
        patientName: json["patient_name"],
        serviceName: json["service_name"],
        servicePrice: json["service_price"],
        clinicId: json["clinic_id"],
        clinicName: json["clinic_name"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        contactno: json["contactno"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "walk_in_id": walkInId,
        "patient_name": patientName,
        "service_name": serviceName,
        "service_price": servicePrice,
        "clinic_id": clinicId,
        "clinic_name": clinicName,
        "date": date.toIso8601String(),
        "time": time,
        "contactno": contactno,
        "email": email,
        "address": address,
      };
}
