import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices extends GetxController {
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  saveCredentials({
    required String accountId,
    required String username,
    required String password,
    required String userId,
    required String userType,
  }) {
    storage.write("accountId", accountId);
    storage.write("username", username);
    storage.write("password", password);
    storage.write("userId", userId);
    storage.write("userType", userType);
  }

  saveClientCredentials({
    required String clientId,
    required String clientName,
    required String clientUsername,
    required String clientPassword,
    required String clientAddress,
    required String clientContactNo,
    required String clientEmail,
  }) {
    storage.write("clientId", clientId);
    storage.write("clientName", clientName);
    storage.write("clientUsername", clientUsername);
    storage.write("clientPassword", clientPassword);
    storage.write("clientAddress", clientAddress);
    storage.write("clientContactNo", clientContactNo);
    storage.write("clientEmail", clientEmail);
  }

  saveClinicDetails({
    required String clinicId,
    required String clinicName,
    required String clinicUsername,
    required String clinicPassword,
    required String clinicAddress,
    required String clinicLat,
    required String clinicLong,
    required String clinicImage,
    required String clinicDentistName,
    required String clinicEmail,
    required String clinicContactNo,
    required String clinicStatus,
    required String subscriptionStatus,
  }) {
    storage.write("clinicId", clinicId);
    storage.write("clinicName", clinicName);
    storage.write("clinicUsername", clinicUsername);
    storage.write("clinicPassword", clinicPassword);
    storage.write("clinicAddress", clinicAddress);
    storage.write("clinicLat", clinicLat);
    storage.write("clinicLong", clinicLong);
    storage.write("clinicImage", clinicImage);
    storage.write("clinicDentistName", clinicDentistName);
    storage.write("clinicEmail", clinicEmail);
    storage.write("clinicContactNo", clinicContactNo);
    storage.write("clinicStatus", clinicStatus);
    storage.write("subscriptionStatus", subscriptionStatus);
  }

  removeStorageCredentials() {
    storage.remove("accountId");
    storage.remove("username");
    storage.remove("password");
    storage.remove("userId");
    storage.remove("userType");
    storage.remove("clientId");
    storage.remove("clientName");
    storage.remove("clientPassword");
    storage.remove("clientAddress");
    storage.remove("clientContactNo");
    storage.remove("clientEmail");

    storage.remove("clinicId");
    storage.remove("clinicName");
    storage.remove("clinicUsername");
    storage.remove("clinicPassword");
    storage.remove("clinicAddress");
    storage.remove("clinicLat");
    storage.remove("clinicLong");
    storage.remove("clinicImage");
    storage.remove("clinicDentistName");
    storage.remove("clinicEmail");
    storage.remove("clinicContactNo");
    storage.remove("clinicStatus");
    storage.remove("subscriptionStatus");
  }

  // alreadyReadFAQsAndTermsAndServices() {
  //   storage.write("isAlreadyDisplay", true);
  // }
}
