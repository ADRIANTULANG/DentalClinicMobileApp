import 'dart:convert';

List<ClientHomeModel> clientHomeModelFromJson(String str) =>
    List<ClientHomeModel>.from(
        json.decode(str).map((x) => ClientHomeModel.fromJson(x)));

String clientHomeModelToJson(List<ClientHomeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientHomeModel {
  ClientHomeModel({
    required this.distance,
    required this.clinicId,
    required this.clinicName,
    required this.clinicUsername,
    required this.clinicPassword,
    required this.clinicAddress,
    required this.clinicLat,
    required this.clinicLong,
    required this.clinicImage,
    required this.clinicDentistName,
    required this.clinicEmail,
    required this.clinicContactNo,
    required this.clinicStatus,
  });

  String distance;
  String clinicId;
  String clinicName;
  String clinicUsername;
  String clinicPassword;
  String clinicAddress;
  String clinicLat;
  String clinicLong;
  String clinicImage;
  String clinicDentistName;
  String clinicEmail;
  String clinicContactNo;
  String clinicStatus;

  factory ClientHomeModel.fromJson(Map<String, dynamic> json) =>
      ClientHomeModel(
        distance: json["distance"],
        clinicId: json["clinic_id"],
        clinicName: json["clinic_name"],
        clinicUsername: json["clinic_username"],
        clinicPassword: json["clinic_password"],
        clinicAddress: json["clinic_address"],
        clinicLat: json["clinic_lat"],
        clinicLong: json["clinic_long"],
        clinicImage: json["clinic_image"],
        clinicDentistName: json["clinic_dentist_name"],
        clinicEmail: json["clinic_email"],
        clinicContactNo: json["clinic_contact_no"],
        clinicStatus: json["clinic_status"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance,
        "clinic_id": clinicId,
        "clinic_name": clinicName,
        "clinic_username": clinicUsername,
        "clinic_password": clinicPassword,
        "clinic_address": clinicAddress,
        "clinic_lat": clinicLat,
        "clinic_long": clinicLong,
        "clinic_image": clinicImage,
        "clinic_dentist_name": clinicDentistName,
        "clinic_email": clinicEmail,
        "clinic_contact_no": clinicContactNo,
        "clinic_status": clinicStatus,
      };
}
