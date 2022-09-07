// import 'package:dcams/constant/color_class.dart';
import 'package:dcams/configs/endPoints.dart';
import 'package:dcams/pages/client_home_screen/dialogs/client_home_screen_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/color_class.dart';
import '../../client_account_screen/view/client_account_view.dart';
import '../../client_appointments_screen/view/client_appointment_view.dart';
import '../../clinic_googlemap_details_screen/view/clinic_googlemaps_details_view.dart';
import '../controller/client_home_screen_controller.dart';

class ClientHomeScreenView extends GetView<ClientHomeViewController> {
  const ClientHomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ClientHomeViewController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: (() => ClientHomeScreenDialog.showLogoutDialog()),
        child: Obx(
          () => controller.isLoading.value == true
              ? Center(
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    child: SpinKitThreeBounce(
                      color: AppColor.mainColors,
                      size: 100.sp,
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 6.h,
                        width: 100.w,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => ClientAccountView());
                              },
                              child: Container(
                                padding: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 227, 234, 241),
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          spreadRadius: 1,
                                          color: Colors.grey),
                                    ]),
                                child: Text(
                                  "Account",
                                  style: TextStyle(
                                    letterSpacing: 1.5,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => ClientAppointmentView());
                              },
                              child: Container(
                                padding: EdgeInsets.all(1.w),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 227, 234, 241),
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          spreadRadius: 1,
                                          color: Colors.grey),
                                    ]),
                                child: Text(
                                  "Appointments",
                                  style: TextStyle(
                                    letterSpacing: 1.5,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            InkWell(
                              onTap: () {
                                ClientHomeScreenDialog.showLogoutDialog();
                              },
                              child: Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 227, 234, 241),
                                    // borderRadius: BorderRadius.circular(3),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          spreadRadius: 1,
                                          color: Colors.grey),
                                    ]),
                                child: Icon(
                                  Icons.logout_rounded,
                                  size: 15.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 12.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Welcome",
                                    style: TextStyle(
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "to Dental Clinic",
                                    style: TextStyle(
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Appointment ",
                                    style: TextStyle(
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.sp),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Management System",
                                    style: TextStyle(
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 12.h,
                              child:
                                  Image.asset("assets/images/splashcrop.png"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 6.h,
                        width: 100.w,
                        child: TextField(
                          controller: controller.searchValue,
                          onChanged: (value) {
                            controller.searchClinic(
                                value: controller.searchValue.text);
                          },
                          obscureText: false,
                          style: TextStyle(letterSpacing: 1, fontSize: 12.sp),
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              suffixIcon: InkWell(
                                onTap: () {
                                  controller.searchValue.clear();
                                  FocusScope.of(context).unfocus();
                                  controller.nearestClinic.assignAll(
                                      controller.nearestClinic_masterList);
                                },
                                child: Icon(
                                  Icons.clear,
                                  size: 17.sp,
                                  color: Colors.red,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                  bottom: 0, left: 3.w, right: 3.w, top: 0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Search Clinic',
                              labelStyle: TextStyle(fontSize: 10.sp)),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Expanded(
                          child: Container(
                        child: Obx(
                          () => ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: controller.nearestClinic.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: 1.h,
                                    bottom: 2.h,
                                    left: 1.w,
                                    right: 1.w),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => ClinicGoogleMapsDetailsView(),
                                        arguments: {
                                          'clientHomeModel':
                                              controller.nearestClinic[index]
                                        });
                                  },
                                  child: Container(
                                    height: 18.h,
                                    width: 100.w,
                                    padding: EdgeInsets.only(
                                        top: 2.w,
                                        bottom: 2.w,
                                        left: 2.w,
                                        right: 2.w),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 227, 234, 241),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 4,
                                              spreadRadius: 1,
                                              color: Colors.grey),
                                        ]),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 16.h,
                                          width: 38.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "${AppEndpoint.endPointDomain_image}/${controller.nearestClinic[index].clinicImage}"))),
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Expanded(
                                            child: Container(
                                          // color: Colors.red,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.nearestClinic[index]
                                                    .clinicName,
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.5),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    size: 14.sp,
                                                  ),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      controller
                                                          .nearestClinic[index]
                                                          .clinicDentistName,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          letterSpacing: .5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.commute,
                                                    size: 15.sp,
                                                  ),
                                                  SizedBox(
                                                    width: .5.w,
                                                  ),
                                                  Text(
                                                    "${double.parse(controller.nearestClinic[index].distance).toStringAsFixed(2).toString()} Kilometers",
                                                    style: TextStyle(
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        letterSpacing: .5),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.email,
                                                    size: 12.sp,
                                                  ),
                                                  SizedBox(
                                                    width: 1.8.w,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      controller
                                                          .nearestClinic[index]
                                                          .clinicEmail,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          letterSpacing: .5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    size: 12.sp,
                                                  ),
                                                  SizedBox(
                                                    width: 1.8.w,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      controller
                                                          .nearestClinic[index]
                                                          .clinicContactNo,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          letterSpacing: .5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
