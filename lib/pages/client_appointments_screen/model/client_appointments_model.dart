import 'dart:convert';

List<ClientAppointmentModel> clientAppointmentModelFromJson(String str) =>
    List<ClientAppointmentModel>.from(
        json.decode(str).map((x) => ClientAppointmentModel.fromJson(x)));

String clientAppointmentModelToJson(List<ClientAppointmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientAppointmentModel {
  ClientAppointmentModel({
    required this.resId,
    required this.resServiceName,
    required this.resClinicId,
    required this.resServicePrice,
    required this.resFee,
    required this.resTotalAmount,
    required this.resSchedule,
    required this.resPaymentGateway,
    required this.resClientId,
    required this.resStatus,
    required this.resRemarks,
    required this.clinicName,
    required this.clinicDentistName,
    required this.clinicImage,
    required this.clinicContactNo,
    required this.clinicEmail,
  });

  String resId;
  String resServiceName;
  String resClinicId;
  String resServicePrice;
  String resFee;
  String resTotalAmount;
  DateTime resSchedule;
  String resPaymentGateway;
  String resClientId;
  String resStatus;
  String resRemarks;
  String clinicName;
  String clinicDentistName;
  String clinicImage;
  String clinicContactNo;
  String clinicEmail;

  factory ClientAppointmentModel.fromJson(Map<String, dynamic> json) =>
      ClientAppointmentModel(
        resId: json["res_id"],
        resServiceName: json["res_service_name"],
        resClinicId: json["res_clinic_id"],
        resServicePrice: json["res_service_price"],
        resFee: json["res_fee"],
        resTotalAmount: json["res_total_amount"],
        resSchedule: DateTime.parse(json["res_schedule"]),
        resPaymentGateway: json["res_payment_gateway"],
        resClientId: json["res_client_id"],
        resStatus: json["res_status"],
        resRemarks: json["res_remarks"],
        clinicName: json["clinic_name"],
        clinicDentistName: json["clinic_dentist_name"],
        clinicImage: json["clinic_image"],
        clinicContactNo: json["clinic_contact_no"],
        clinicEmail: json["clinic_email"],
      );

  Map<String, dynamic> toJson() => {
        "res_id": resId,
        "res_service_name": resServiceName,
        "res_clinic_id": resClinicId,
        "res_service_price": resServicePrice,
        "res_fee": resFee,
        "res_total_amount": resTotalAmount,
        "res_schedule": resSchedule.toIso8601String(),
        "res_payment_gateway": resPaymentGateway,
        "res_client_id": resClientId,
        "res_status": resStatus,
        "res_remarks": resRemarks,
        "clinic_name": clinicName,
        "clinic_dentist_name": clinicDentistName,
        "clinic_image": clinicImage,
        "clinic_contact_no": clinicContactNo,
        "clinic_email": clinicEmail,
      };
}
