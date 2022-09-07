import 'package:dcams/configs/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/color_class.dart';
// import '../../../services/location_services.dart';
import '../../../services/location_services.dart';
import '../../clinic_services_list_screen/view/clinic_services_list_view.dart';
import '../controller/clinic_googlemaps_details_controller.dart';

class ClinicGoogleMapsDetailsView
    extends GetView<CliniGoogleMapsDetailsController> {
  const ClinicGoogleMapsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CliniGoogleMapsDetailsController());
    return Scaffold(
      body: Obx(() => controller.isLoading.value == false
          ? Container(
              height: 100.h,
              width: 100.w,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    child: Obx(
                      () => GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              Get.find<LocationServices>().user_latitude,
                              Get.find<LocationServices>().user_longitude),
                          zoom: 14.4746,
                        ),
                        markers: Set<Marker>.of(controller.markers),
                        onMapCreated:
                            (GoogleMapController googlemapcontroller) async {
                          if (!controller.mapcontroller.isCompleted) {
                            controller.mapcontroller
                                .complete(googlemapcontroller);
                          }
                          controller.googleMapController =
                              await googlemapcontroller;
                          controller.getCenter(
                              currentLatlng: LatLng(
                                  Get.find<LocationServices>().user_latitude,
                                  Get.find<LocationServices>().user_longitude),
                              clinicLatlng: LatLng(
                                  double.parse(
                                      controller.clientHomeModel!.clinicLat),
                                  double.parse(
                                      controller.clientHomeModel!.clinicLong)));
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    child: Obx(
                      () => controller.isShownClinicDetails.value == true
                          ? Container(
                              height: 28.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 227, 234, 241),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 5.w, top: 1.h),
                                    width: 100.w,
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        controller.isShownClinicDetails.value =
                                            false;
                                      },
                                      child: Icon(
                                        Icons.arrow_drop_down_circle_rounded,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.w, right: 2.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 22.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "${AppEndpoint.endPointDomain_image}/${controller.clientHomeModel!.clinicImage}"))),
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: 22.h,
                                              padding:
                                                  EdgeInsets.only(left: 2.w),
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      controller
                                                          .clientHomeModel!
                                                          .clinicName,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 15.sp,
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  Text(
                                                      controller
                                                          .clientHomeModel!
                                                          .clinicDentistName,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 9.sp,
                                                          letterSpacing: 1,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  Text(
                                                      double.parse(controller
                                                                  .clientHomeModel!
                                                                  .distance)
                                                              .toStringAsFixed(
                                                                  2) +
                                                          " Kilometers",
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 9.sp,
                                                          letterSpacing: 1,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  Text(
                                                      controller
                                                          .clientHomeModel!
                                                          .clinicAddress,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 9.sp,
                                                          letterSpacing: 1,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  Text(
                                                      controller
                                                          .clientHomeModel!
                                                          .clinicEmail,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 9.sp,
                                                          letterSpacing: 1,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  Text(
                                                      controller
                                                          .clientHomeModel!
                                                          .clinicContactNo,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 9.sp,
                                                          letterSpacing: 1,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.to(
                                                            () =>
                                                                ClinicServicesListView(),
                                                            arguments: {
                                                              "clinicID": controller
                                                                  .clientHomeModel!
                                                                  .clinicId
                                                                  .toString(),
                                                              "clinicName": controller
                                                                  .clientHomeModel!
                                                                  .clinicName
                                                                  .toString(),
                                                              "clinicContactNo":
                                                                  controller
                                                                      .clientHomeModel!
                                                                      .clinicContactNo
                                                                      .toString(),
                                                              "clinicDentist": controller
                                                                  .clientHomeModel!
                                                                  .clinicDentistName
                                                                  .toString(),
                                                            });
                                                      },
                                                      child: Container(
                                                        height: 4.5.h,
                                                        width: 40.w,
                                                        decoration: BoxDecoration(
                                                            color: AppColor
                                                                .mainColors,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                            "View Services",
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontSize: 9.sp,
                                                                letterSpacing:
                                                                    1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: 7.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 227, 234, 241),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25))),
                              child: IconButton(
                                  onPressed: () {
                                    controller.isShownClinicDetails.value =
                                        true;
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_up_rounded,
                                    size: 40.sp,
                                  )),
                            ),
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: Container(
                height: 100.h,
                width: 100.w,
                child: SpinKitThreeBounce(
                  color: AppColor.mainColors,
                  size: 100.sp,
                ),
              ),
            )),
    );
  }
}
