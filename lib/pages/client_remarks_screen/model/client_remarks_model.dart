import 'dart:convert';

List<ClientRemarksModel> clientRemarksModelFromJson(String str) =>
    List<ClientRemarksModel>.from(
        json.decode(str).map((x) => ClientRemarksModel.fromJson(x)));

String clientRemarksModelToJson(List<ClientRemarksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientRemarksModel {
  ClientRemarksModel({
    required this.remId,
    required this.remarks,
    required this.clinicId,
    required this.clientId,
    required this.remarksPermission,
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
  String remarksPermission;
  DateTime createdAt;
  String clinicName;
  String clinicDentistName;
  String clinicEmail;
  String clinicContactNo;
  String clinicAddress;

  factory ClientRemarksModel.fromJson(Map<String, dynamic> json) =>
      ClientRemarksModel(
        remId: json["rem_id"],
        remarks: json["remarks"],
        clinicId: json["clinic_id"],
        clientId: json["client_id"],
        remarksPermission: json["remarks_permission"],
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
        "remarks_permission": remarksPermission,
        "created_at": createdAt.toIso8601String(),
        "clinic_name": clinicName,
        "clinic_dentist_name": clinicDentistName,
        "clinic_email": clinicEmail,
        "clinic_contact_no": clinicContactNo,
        "clinic_address": clinicAddress,
      };
}
