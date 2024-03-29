import 'dart:convert';

List<RemarksModel> remarksModelFromJson(String str) => List<RemarksModel>.from(
    json.decode(str).map((x) => RemarksModel.fromJson(x)));

String remarksModelToJson(List<RemarksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RemarksModel {
  RemarksModel({
    required this.remId,
    required this.remarks,
    required this.clinicId,
    required this.clientId,
    required this.createdAt,
    required this.clinicName,
    required this.clinicDentistName,
    required this.clinicEmail,
    required this.clinicContactNo,
    required this.clinicAddress,
  });

  String remId;
  String remarks;
  String clinicId;
  String clientId;
  DateTime createdAt;
  String clinicName;
  String clinicDentistName;
  String clinicEmail;
  String clinicContactNo;
  String clinicAddress;

  factory RemarksModel.fromJson(Map<String, dynamic> json) => RemarksModel(
        remId: json["rem_id"],
        remarks: json["remarks"],
        clinicId: json["clinic_id"],
        clientId: json["client_id"],
        createdAt: DateTime.parse(json["created_at"]),
        clinicName: json["clinic_name"],
        clinicDentistName: json["clinic_dentist_name"],
        clinicEmail: json["clinic_email"],
        clinicContactNo: json["clinic_contact_no"],
        clinicAddress: json["clinic_address"],
      );

  Map<String, dynamic> toJson() => {
        "rem_id": remId,
        "remarks": remarks,
        "clinic_id": clinicId,
        "client_id": clientId,
        "created_at": createdAt.toIso8601String(),
        "clinic_name": clinicName,
        "clinic_dentist_name": clinicDentistName,
        "clinic_email": clinicEmail,
        "clinic_contact_no": clinicContactNo,
        "clinic_address": clinicAddress,
      };
}
