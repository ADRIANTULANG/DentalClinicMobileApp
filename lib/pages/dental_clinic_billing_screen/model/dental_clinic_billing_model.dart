import 'dart:convert';

List<DentalClinicBillingModel> dentalClinicBillingModelFromJson(String str) =>
    List<DentalClinicBillingModel>.from(
        json.decode(str).map((x) => DentalClinicBillingModel.fromJson(x)));

String dentalClinicBillingModelToJson(List<DentalClinicBillingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DentalClinicBillingModel {
  DentalClinicBillingModel({
    required this.servicesId,
    required this.servicesName,
    required this.servicesClinicId,
    required this.servicesPrice,
    required this.servicesDescription,
    required this.servicesStatus,
    required this.numberOftransactServices,
  });

  String servicesId;
  String servicesName;
  String servicesClinicId;
  String servicesPrice;
  String servicesDescription;
  String servicesStatus;
  String numberOftransactServices;

  factory DentalClinicBillingModel.fromJson(Map<String, dynamic> json) =>
      DentalClinicBillingModel(
        servicesId: json["services_id"],
        servicesName: json["services_name"],
        servicesClinicId: json["services_clinic_id"],
        servicesPrice: json["services_price"],
        servicesDescription: json["services_description"],
        servicesStatus: json["services_status"],
        numberOftransactServices: json["numberOftransactServices"],
      );

  Map<String, dynamic> toJson() => {
        "services_id": servicesId,
        "services_name": servicesName,
        "services_clinic_id": servicesClinicId,
        "services_price": servicesPrice,
        "services_description": servicesDescription,
        "services_status": servicesStatus,
        "numberOftransactServices": numberOftransactServices,
      };
}
