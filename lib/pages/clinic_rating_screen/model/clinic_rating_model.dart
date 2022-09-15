import 'dart:convert';

List<ClinicRatingModel> clinicRatingModelFromJson(String str) =>
    List<ClinicRatingModel>.from(
        json.decode(str).map((x) => ClinicRatingModel.fromJson(x)));

String clinicRatingModelToJson(List<ClinicRatingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicRatingModel {
  ClinicRatingModel({
    required this.ratingId,
    required this.ratingClinicId,
    required this.ratingClientId,
    required this.ratingComment,
    required this.ratingScore,
    required this.clientName,
  });

  String ratingId;
  String ratingClinicId;
  String ratingClientId;
  String ratingComment;
  String ratingScore;
  String clientName;

  factory ClinicRatingModel.fromJson(Map<String, dynamic> json) =>
      ClinicRatingModel(
        ratingId: json["rating_id"],
        ratingClinicId: json["rating_clinic_id"],
        ratingClientId: json["rating_client_id"],
        ratingComment: json["rating_comment"],
        ratingScore: json["rating_score"],
        clientName: json["client_name"],
      );

  Map<String, dynamic> toJson() => {
        "rating_id": ratingId,
        "rating_clinic_id": ratingClinicId,
        "rating_client_id": ratingClientId,
        "rating_comment": ratingComment,
        "rating_score": ratingScore,
        "client_name": clientName,
      };
}
