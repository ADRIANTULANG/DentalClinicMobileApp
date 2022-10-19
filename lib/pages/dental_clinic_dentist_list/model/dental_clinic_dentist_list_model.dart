// To parse this JSON data, do
//
//     final dentistModel = dentistModelFromJson(jsonString);

import 'dart:convert';

List<DentistModel> dentistModelFromJson(String str) => List<DentistModel>.from(
    json.decode(str).map((x) => DentistModel.fromJson(x)));

String dentistModelToJson(List<DentistModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DentistModel {
  DentistModel({
    required this.dentistId,
    required this.dentistClinicId,
    required this.dentistName,
    required this.dentistContact,
    required this.dentistEmail,
    required this.status,
  });

  String dentistId;
  String dentistClinicId;
  String dentistName;
  String dentistContact;
  String dentistEmail;
  String status;

  factory DentistModel.fromJson(Map<String, dynamic> json) => DentistModel(
        dentistId: json["dentist_id"],
        dentistClinicId: json["dentist_clinic_id"],
        dentistName: json["dentist_name"],
        dentistContact: json["dentist_contact"],
        dentistEmail: json["dentist_email"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "dentist_id": dentistId,
        "dentist_clinic_id": dentistClinicId,
        "dentist_name": dentistName,
        "dentist_contact": dentistContact,
        "dentist_email": dentistEmail,
        "status": status,
      };
}
