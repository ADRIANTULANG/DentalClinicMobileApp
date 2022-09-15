import 'dart:convert';

List<DentalClinicAppointmentsModle> dentalClinicAppointmentsModleFromJson(
        String str) =>
    List<DentalClinicAppointmentsModle>.from(
        json.decode(str).map((x) => DentalClinicAppointmentsModle.fromJson(x)));

String dentalClinicAppointmentsModleToJson(
        List<DentalClinicAppointmentsModle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DentalClinicAppointmentsModle {
  DentalClinicAppointmentsModle({
    required this.resId,
    required this.resServiceName,
    required this.resClinicId,
    required this.resServicePrice,
    required this.resFee,
    required this.resTotalAmount,
    required this.resSchedule,
    required this.resScheduleTime,
    required this.resPaymentGateway,
    required this.resClientId,
    required this.resStatus,
    required this.resRemarks,
    required this.clientName,
  });

  String resId;
  String resServiceName;
  String resClinicId;
  String resServicePrice;
  String resFee;
  String resTotalAmount;
  DateTime resSchedule;
  String resScheduleTime;
  String resPaymentGateway;
  String resClientId;
  String resStatus;
  String resRemarks;
  String clientName;

  factory DentalClinicAppointmentsModle.fromJson(Map<String, dynamic> json) =>
      DentalClinicAppointmentsModle(
        resId: json["res_id"],
        resServiceName: json["res_service_name"],
        resClinicId: json["res_clinic_id"],
        resServicePrice: json["res_service_price"],
        resFee: json["res_fee"],
        resTotalAmount: json["res_total_amount"],
        resSchedule: DateTime.parse(json["res_schedule"]),
        resScheduleTime: json["res_schedule_time"],
        resPaymentGateway: json["res_payment_gateway"],
        resClientId: json["res_client_id"],
        resStatus: json["res_status"],
        resRemarks: json["res_remarks"],
        clientName: json["client_name"],
      );

  Map<String, dynamic> toJson() => {
        "res_id": resId,
        "res_service_name": resServiceName,
        "res_clinic_id": resClinicId,
        "res_service_price": resServicePrice,
        "res_fee": resFee,
        "res_total_amount": resTotalAmount,
        "res_schedule": resSchedule.toIso8601String(),
        "res_schedule_time": resScheduleTime,
        "res_payment_gateway": resPaymentGateway,
        "res_client_id": resClientId,
        "res_status": resStatus,
        "res_remarks": resRemarks,
        "client_name": clientName,
      };
}

List<ClinicSubscriptionDates> clinicSubscriptionDatesFromJson(String str) =>
    List<ClinicSubscriptionDates>.from(
        json.decode(str).map((x) => ClinicSubscriptionDates.fromJson(x)));

String clinicSubscriptionDatesToJson(List<ClinicSubscriptionDates> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicSubscriptionDates {
  ClinicSubscriptionDates({
    required this.subsId,
    required this.subsClinicId,
    required this.subsAmount,
    required this.subsExpirationDate,
    required this.subsPurchasedDate,
  });

  String subsId;
  String subsClinicId;
  String subsAmount;
  DateTime subsExpirationDate;
  DateTime subsPurchasedDate;

  factory ClinicSubscriptionDates.fromJson(Map<String, dynamic> json) =>
      ClinicSubscriptionDates(
        subsId: json["subs_id"],
        subsClinicId: json["subs_clinic_id"],
        subsAmount: json["subs_amount"],
        subsExpirationDate: DateTime.parse(json["subs_expiration_date"]),
        subsPurchasedDate: DateTime.parse(json["subs_purchased_date"]),
      );

  Map<String, dynamic> toJson() => {
        "subs_id": subsId,
        "subs_clinic_id": subsClinicId,
        "subs_amount": subsAmount,
        "subs_expiration_date": subsExpirationDate.toIso8601String(),
        "subs_purchased_date": subsPurchasedDate.toIso8601String(),
      };
}
