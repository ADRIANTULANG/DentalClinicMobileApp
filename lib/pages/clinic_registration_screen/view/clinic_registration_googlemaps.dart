import 'dart:async';

import 'package:dcams/pages/clinic_registration_screen/controller/clinic_registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/color_class.dart';
import '../../../services/location_services.dart';

class ClinicRegistrationGoogleMaps
    extends GetView<ClinicRegistrationController> {
  const ClinicRegistrationGoogleMaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Obx(
            () => GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(Get.find<LocationServices>().user_latitude,
                    Get.find<LocationServices>().user_longitude),
                zoom: 16.4746,
              ),
              onTap: (LatLng location) {
                controller.ontap_GoogleMap(
                    latitude: location.latitude, longitude: location.longitude);
              },
              markers: Set<Marker>.of(controller.markers),
              onMapCreated: (GoogleMapController googlemapcontroller) {
                if (controller.mapcontroller.isCompleted == true) {
                  controller.mapcontroller.complete(googlemapcontroller);
                } else {}
                controller.googleMapController = googlemapcontroller;
              },
            ),
          ),
          Obx(
            () => controller.isLoading.value == false
                ? InkWell(
                    onTap: () {
                      if (controller.clinic_lat.value == 0.0 ||
                          controller.clinic_long.value == 0.0) {
                        Get.snackbar(
                          "Message",
                          "Please Select a Location",
                          colorText: Colors.white,
                          backgroundColor: AppColor.mainColors,
                          snackPosition: SnackPosition.TOP,
                        );
                      } else {
                        controller.verifiyNumber(
                            contact: controller.clinicContactno.text);
                        controller.isLoading.value = true;
                      }
                      // controller.uploadCompanyLogo();
                    },
                    child: Container(
                      height: 10.h,
                      width: 100.w,
                      alignment: Alignment.center,
                      child: Container(
                        height: 8.h,
                        width: 80.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          "SET",
                          style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 10.h,
                    width: 100.w,
                    alignment: Alignment.center,
                    child: Container(
                      height: 8.h,
                      width: 80.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.mainColors,
                          borderRadius: BorderRadius.circular(12)),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
          Positioned(
            bottom: 85.h,
            child: Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              height: 8.h,
              width: 100.w,
              child: TextField(
                obscureText: false,
                controller: controller.placesString,
                onChanged: (value) {
                  if (controller.debounce?.isActive ?? false)
                    controller.debounce!.cancel();
                  controller.debounce =
                      Timer(const Duration(milliseconds: 1000), () {
                    FocusScope.of(context).unfocus();
                    if (controller.placesString.text.trim().toString() == "") {
                    } else {
                      controller.searchPlaces(
                          place: controller.placesString.text,
                          context: context);
                    }
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.mainColors,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: '  Search Place',
                  hintText: 'Enter Place',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
