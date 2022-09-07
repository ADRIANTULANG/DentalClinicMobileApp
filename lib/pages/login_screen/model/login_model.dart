import 'dart:convert';

List<LoginModel> loginModelFromJson(String str) =>
    List<LoginModel>.from(json.decode(str).map((x) => LoginModel.fromJson(x)));

String loginModelToJson(List<LoginModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginModel {
  LoginModel({
    required this.accountId,
    required this.username,
    required this.password,
    required this.userId,
    required this.userType,
  });

  String accountId;
  String username;
  String password;
  String userId;
  String userType;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accountId: json["account_id"],
        username: json["username"],
        password: json["password"],
        userId: json["user_id"],
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "username": username,
        "password": password,
        "user_id": userId,
        "user_type": userType,
      };
}

List<ClientModel> clientModelFromJson(String str) => List<ClientModel>.from(
    json.decode(str).map((x) => ClientModel.fromJson(x)));

String clientModelToJson(List<ClientModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientModel {
  ClientModel({
    required this.clientId,
    required this.clientName,
    required this.clientUsername,
    required this.clientPassword,
    required this.clientAddress,
    required this.clientContactNo,
    required this.clientEmail,
  });

  String clientId;
  String clientName;
  String clientUsername;
  String clientPassword;
  String clientAddress;
  String clientContactNo;
  String clientEmail;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        clientId: json["client_id"],
        clientName: json["client_name"],
        clientUsername: json["client_username"],
        clientPassword: json["client_password"],
        clientAddress: json["client_address"],
        clientContactNo: json["client_contact_no"],
        clientEmail: json["client_email"],
      );

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_name": clientName,
        "client_username": clientUsername,
        "client_password": clientPassword,
        "client_address": clientAddress,
        "client_contact_no": clientContactNo,
        "client_email": clientEmail,
      };
}

List<ClinicModel> clinicModelFromJson(String str) => List<ClinicModel>.from(
    json.decode(str).map((x) => ClinicModel.fromJson(x)));

String clinicModelToJson(List<ClinicModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicModel {
  ClinicModel(
      {required this.clinicId,
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
      required this.subscriptionStatus});

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
  String subscriptionStatus;
  String clinicStatus;

  factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
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
        subscriptionStatus: json["subscription_status"],
      );

  Map<String, dynamic> toJson() => {
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
        "subscription_status": subscriptionStatus,
      };
}
