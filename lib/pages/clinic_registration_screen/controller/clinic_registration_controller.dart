import 'dart:async';

import 'package:dcams/constant/color_class.dart';
import 'package:dcams/pages/clinic_registration_screen/api/clinic_registration_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../login_screen/view/login_screen_view.dart';
import '../model/clinic_registration_model.dart';
import '../view/clinic_registration_opt_view.dart';

class ClinicRegistrationController extends GetxController {
  final ImagePicker picker = ImagePicker();
  RxBool isCreating = false.obs;
  TextEditingController clinicName = TextEditingController();
  TextEditingController clinicUsername = TextEditingController();
  TextEditingController clinicPassword = TextEditingController();
  TextEditingController clinicAddress = TextEditingController();
  TextEditingController clinicDentistName = TextEditingController();
  TextEditingController clinicEmailAdd = TextEditingController();
  TextEditingController clinicContactno = TextEditingController();
  RxBool isLoading = false.obs;
  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<Marker> markers = <Marker>[].obs;

  TextEditingController placesString = TextEditingController();

  Timer? debounce;

  FirebaseAuth auth = FirebaseAuth.instance;

  String verifIDReceived = "";

  RxDouble clinic_lat = 0.0.obs;
  RxDouble clinic_long = 0.0.obs;

  RxList<ImageModel> listOfImage = <ImageModel>[].obs;
  RxList<ImageModel> listOfImage_businessPermit = <ImageModel>[].obs;
  RxList<ImageModel> listOfImage_dti = <ImageModel>[].obs;
  RxList<ImageModel> listOfImage_certofPhgeps = <ImageModel>[].obs;
  RxList<ImageModel> listOfImage_bir = <ImageModel>[].obs;

  XFile? image;
  RxString imagepath = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  openGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagepath.value = image!.path;
    }
  }

  openCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagepath.value = image!.path;
    }
  }

  addImageGallery_bussinesPermit() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.gallery);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageModel imageModel = ImageModel(
          imagePath: imagePath,
          imageFile: imageSelected,
          imageDescription: "Business Permit");
      listOfImage_businessPermit.add(imageModel);
    }
  }

  addImageCamera_bussinesPermit() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.camera);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageModel imageModel = ImageModel(
          imagePath: imagePath,
          imageFile: imageSelected,
          imageDescription: "Business Permit");
      listOfImage_businessPermit.add(imageModel);
    }
  }

  addImageGallery_dti() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.gallery);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageModel imageModel = ImageModel(
          imagePath: imagePath,
          imageFile: imageSelected,
          imageDescription: "DTI Permit");
      listOfImage_dti.add(imageModel);
    }
  }

  addImageCamera_dti() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.camera);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageModel imageModel = ImageModel(
          imagePath: imagePath,
          imageFile: imageSelected,
          imageDescription: "DTI Permit");
      listOfImage_dti.add(imageModel);
    }
  }

  addImageGallery_Certificate_of_Phgeps() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.gallery);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageModel imageModel = ImageModel(
          imagePath: imagePath,
          imageFile: imageSelected,
          imageDescription: "Certificate of PHgeps");
      listOfImage_certofPhgeps.add(imageModel);
    }
  }

  addImageCamera_Certificate_of_Phgeps() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.camera);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageModel imageModel = ImageModel(
          imagePath: imagePath,
          imageFile: imageSelected,
          imageDescription: "Certificate of PHgeps");
      listOfImage_certofPhgeps.add(imageModel);
    }
  }

  addImageGallery_bir() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.gallery);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageModel imageModel = ImageModel(
          imagePath: imagePath,
          imageFile: imageSelected,
          imageDescription: "BIR Permit");
      listOfImage_bir.add(imageModel);
    }
  }

  addImageCamera_bir() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.camera);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageModel imageModel = ImageModel(
          imagePath: imagePath,
          imageFile: imageSelected,
          imageDescription: "BIR Permit");
      listOfImage_bir.add(imageModel);
    }
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
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verifIDReceived = verificationID;
          print(verificationID);
          print(resendToken);
          Get.to(() => ClinicRegistrationOtpView());
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
        createClinic();
        // controller.addUser(context);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  createClinic() async {
    var clinicId = await ClinicRegistrationApi.createClinicAccount(
        clinic_name: clinicName.text,
        clinic_username: clinicUsername.text,
        clinic_password: clinicPassword.text,
        clinic_address: clinicAddress.text,
        clinic_lat: clinic_lat.value.toString(),
        clinic_long: clinic_long.value.toString(),
        clinic_image: image!.name,
        clinic_dentist_name: clinicDentistName.text,
        clinic_email: clinicEmailAdd.text,
        clinic_contact_no: clinicContactno.text);
    uploadImageLogo();
    if (clinicId != false) {
      uploadClinicDocuments(clinicId: clinicId);
    } else {
      Get.snackbar(
        "Message",
        "Sorry.. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  uploadImageLogo() async {
    var result = await ClinicRegistrationApi.uploadImage(
        imagename: image!.name, filepath: image!.path);
    print(result);
  }

  uploadClinicDocuments({required String clinicId}) async {
    for (var i = 0; i < listOfImage.length; i++) {
      await ClinicRegistrationApi.uploadImage(
          imagename: listOfImage[i].imageFile!.name,
          filepath: listOfImage[i].imageFile!.path);
      await ClinicRegistrationApi.createClinicDocuments(
          clinicid: clinicId,
          clinic_document_name: listOfImage[i].imageFile!.name,
          clinic_document_descritpion: listOfImage[i].imageDescription);
    }
    Get.offAll(LoginScreenView());
    Get.snackbar("Message",
        "Yaaay!.. Account successfully submitted. The Management will evaluate your account. Please wait for the approval. Thanks!",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 30));
  }

  ontap_GoogleMap({required double latitude, required double longitude}) async {
    markers.clear();
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      for (var i = 0; i < placemarks.length; i++) {
        print(placemarks[i].country);
        print(placemarks[i].locality);
        print(placemarks[i].subLocality);
        print("----------");
      }
    } on Exception catch (e) {
      print("catch exception $e");
    }
    markers.add(Marker(
      markerId: MarkerId("new"),
      position: LatLng(latitude, longitude),
    ));
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(latitude, longitude),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414)));
    clinic_lat.value = latitude;
    clinic_long.value = longitude;
  }

  searchPlaces({required String place, required BuildContext context}) async {
    markers.clear();
    try {
      List<Location> locations = await locationFromAddress(place);
      for (var i = 0; i < locations.length; i++) {
        print(locations[i].latitude);
        print(locations[i].longitude);
        markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(locations[i].latitude, locations[i].longitude),
        ));

        googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(locations[i].latitude, locations[i].longitude),
                tilt: 59.440717697143555,
                zoom: 19.151926040649414)));
        clinic_lat.value = locations[i].latitude;
        clinic_long.value = locations[i].longitude;
      }
    } on Exception catch (e) {
      print(e);
      Get.snackbar(
        "Message",
        "Sorry we can't find the place. Please input complete address name. Thank you",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
