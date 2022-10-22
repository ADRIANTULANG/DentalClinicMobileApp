import 'package:dcams/configs/endPoints.dart';
import 'package:dcams/pages/dental_clinic_home_screen/view/dental_clinic_approved_tab.dart';
import 'package:dcams/pages/dental_clinic_home_screen/view/dental_clinic_pending_tab.dart';
import 'package:dcams/pages/dental_clinic_subscription_screen/view/dental_clinic_subscription_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/color_class.dart';
import '../../dental_clinic_account_screen/view/dental_clinic_account_view.dart';
import '../../dental_clinic_dentist_list/view/dental_clinic_dentist_list_view.dart';
import '../../dental_clinic_services_list/view/dental_clinic_services_view.dart';
import '../../dental_clinic_walkin_screen/view/dental_clinic_walkin_screen_view.dart';
import '../controller/dental_clinic_home_screen_controller.dart';
import '../dialogs/dental_clinic_home_Screen_dialogs.dart';
import 'dental_clinic_history_view.dart';

class DentalClinicHomeScreenView
    extends GetView<DentalClinicHomeScreenController> {
  const DentalClinicHomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DentalClinicHomeScreenController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: (() => DentalClinicHomeScreenDialogs.showLogoutDialog()),
        child: RefreshIndicator(
          onRefresh: () => controller.refreshDate(),
          child: Obx(
            () => controller.isLoading.value == true
                ? Container(
                    height: 100.h,
                    width: 100.w,
                    child: Center(
                      child: SpinKitThreeBounce(
                        color: AppColor.mainColors,
                        size: 100.sp,
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
                    child: Column(
                      children: [
                        Container(
                          height: 6.h,
                          width: 100.w,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  DentalClinicHomeScreenDialogs
                                      .showLogoutDialog();
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
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Obx(
                                () => controller.subscriptionStatus.value ==
                                        "Unpaid"
                                    ? InkWell(
                                        onTap: () {
                                          Get.to(() =>
                                              DentalClinicSubscriptionView());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(2.w),
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 227, 234, 241),
                                              // borderRadius: BorderRadius.circular(3),
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 4,
                                                    spreadRadius: 1,
                                                    color: Colors.grey),
                                              ]),
                                          child: Icon(
                                            Icons.attach_money,
                                            size: 15.sp,
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                              Expanded(child: SizedBox()),
                              // InkWell(
                              //   onTap: () {
                              //     Get.to(() => DentalClinicBillingView());
                              //   },
                              //   child: Container(
                              //     padding: EdgeInsets.all(1.w),
                              //     decoration: BoxDecoration(
                              //         color: Color.fromARGB(255, 227, 234, 241),
                              //         borderRadius: BorderRadius.circular(3),
                              //         boxShadow: [
                              //           BoxShadow(
                              //               blurRadius: 4,
                              //               spreadRadius: 1,
                              //               color: Colors.grey),
                              //         ]),
                              //     child: Text(
                              //       "Billings",
                              //       style: TextStyle(
                              //         letterSpacing: 1.5,
                              //         fontSize: 12.sp,
                              //         fontWeight: FontWeight.w600,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                width: 3.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => DentalClinicAccountView());
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
                                width: 2.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => DentalClinicServicesListView());
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
                                    "Services",
                                    style: TextStyle(
                                      letterSpacing: 1.5,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: .1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => DentalClinicWalkInView());
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
                                  "Walk-ins",
                                  style: TextStyle(
                                    letterSpacing: 1.5,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => DentalClinicHistoryView());
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
                                  "History",
                                  style: TextStyle(
                                    letterSpacing: 1.5,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => DentalClinicDentistView());
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
                                  "Dentist",
                                  style: TextStyle(
                                    letterSpacing: 1.5,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // controller.testFunction();
                              },
                              child: Container(
                                height: 20.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "${AppEndpoint.endPointDomain_image}/${controller.dentalClinicImage.value}"))),
                              ),
                            ),
                            Container(
                              height: 20.h,
                              width: 40.w,
                              padding: EdgeInsets.only(left: 3.5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => Text(
                                      controller.dentalClinicName.value,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.5,
                                          fontSize: 18),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  // Obx(
                                  //   () => Text(
                                  //     controller.dentalClinicDentist.value,
                                  //     style: TextStyle(
                                  //         fontWeight: FontWeight.w500,
                                  //         letterSpacing: 1.5,
                                  //         color: Colors.grey,
                                  //         fontSize: 12),
                                  //   ),
                                  // ),
                                  Obx(
                                    () => Text(
                                      controller.dentalClinicAddress.value,
                                      maxLines: 3,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5,
                                          color: Colors.grey,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.dentalClinicEmailAdd.value,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5,
                                          color: Colors.grey,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.dentalClinicContactNo.value,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.5,
                                          color: Colors.grey,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Appointments",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                              fontSize: 15),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Container(
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.isPendingSelected.value = true;
                                },
                                child: Obx(
                                  () => Container(
                                    padding: EdgeInsets.only(
                                        left: 10.w,
                                        right: 10.w,
                                        top: 1.5.h,
                                        bottom: 1.5.h),
                                    decoration: BoxDecoration(
                                        color: controller
                                                    .isPendingSelected.value ==
                                                true
                                            ? AppColor.mainColors
                                            : null,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      "Pending",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.5,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.isPendingSelected.value = false;
                                },
                                child: Obx(
                                  () => Container(
                                    padding: EdgeInsets.only(
                                        left: 10.w,
                                        right: 10.w,
                                        top: 1.5.h,
                                        bottom: 1.5.h),
                                    decoration: BoxDecoration(
                                        color: controller
                                                    .isPendingSelected.value ==
                                                false
                                            ? AppColor.mainColors
                                            : null,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      "Approved",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.5,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(() => controller.isPendingSelected.value == true
                            ? PendingTab()
                            : ApprovedTab())
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
