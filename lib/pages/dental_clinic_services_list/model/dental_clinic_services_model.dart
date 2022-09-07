import 'dart:convert';

List<DentalClinicServicesModel> dentalClinicServicesModelFromJson(String str) =>
    List<DentalClinicServicesModel>.from(
        json.decode(str).map((x) => DentalClinicServicesModel.fromJson(x)));

String dentalClinicServicesModelToJson(List<DentalClinicServicesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DentalClinicServicesModel {
  DentalClinicServicesModel({
    required this.servicesId,
    required this.servicesName,
    required this.servicesClinicId,
    required this.servicesPrice,
    required this.servicesDescription,
    required this.servicesStatus,
  });

  String servicesId;
  String servicesName;
  String servicesClinicId;
  String servicesPrice;
  String servicesDescription;
  String servicesStatus;

  factory DentalClinicServicesModel.fromJson(Map<String, dynamic> json) =>
      DentalClinicServicesModel(
        servicesId: json["services_id"],
        servicesName: json["services_name"],
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
