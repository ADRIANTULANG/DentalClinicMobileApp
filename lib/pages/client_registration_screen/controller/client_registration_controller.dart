import 'package:dcams/constant/color_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/client_registration_api.dart';
import '../view/client_registration_otp_view.dart';

class ClientRegistrationController extends GetxController {
  RxBool isCreating = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactno = TextEditingController();
  TextEditingController emailAdd = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String verifIDReceived = "";
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  verifiyNumber({required String contact}) {
    isCreating(true);
    auth.verifyPhoneNumber(
        phoneNumber: "+63$contact",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print(value.credential);
            print("smsCode: ${credential.smsCode}");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print("EXCEPTION ERROR: ${exception.message}");
        },
        codeSent: (String verificationID, int? resendToken) {
          verifIDReceived = verificationID;
          print(verificationID);
          print(resendToken);
          Get.to(() => ClientRegistrationOtp());
          isCreating(false);
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential, context) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        print("OTP SUCCESS");
        createClientAccount();
        // uploadCompanyLogo();
        // controller.addUser(context);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  createClientAccount() async {
    var isSuccess = await ClientRegistrationApi.createClientAccount(
        name: name.text,
        username: username.text,
        password: password.text,
        address: address.text,
        contactno: contactno.text,
        emailAdd: emailAdd.text);
    if (isSuccess == true) {
      Get.back();
      Get.back();
      Get.snackbar(
        "Message",
        "Account Succesfully Created!",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Message",
        "Sorry. Please try again later",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
