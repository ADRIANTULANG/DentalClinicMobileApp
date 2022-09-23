import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class RightsAndResponsibilitiesViewForViewing extends StatelessWidget {
  const RightsAndResponsibilitiesViewForViewing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 8.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 100.w,
                  alignment: Alignment.center,
                  child: Text(
                    "PATIENT RIGHTS",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                        letterSpacing: 2),
                  )),
              Container(
                width: 100.w,
                alignment: Alignment.center,
                child: Text(
                  "AND RESPONSIBILITIES",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                      letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "The following is a suggested list of patient rights and responsibilities. Specific patient rights and responsibilities may be mandated by state law—the organization should amend these as needed to meet state law.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "As part of our strong commitment to quality care and customer service, the clinic wants to keep you informed about your rights and responsibilities.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "• The clinic only appoints services so its your responsibility to acquire consultation first in a clinic.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "• You are responsible for the risk of appointing services without proper consultation of a dental specialist.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "• You have the right to be provided with appropriate information about providers, policies and procedures.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "• You have the right to be informed by your dentist regarding your diagnosis, treatment and prognosis in terms you can understand.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "• You have the right to receive sufficient information from your dentist to enable you to give informed consent before beginning any dental procedure or treatment.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "• You have the right to be treated with respect, dignity and with recognition of your privacy.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "• You have the right to refuse treatment, drugs or other procedures recommended by clinic providers and to the extent permitted by law and to be made aware of the potential consequences of refusing recommended treatment.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "• You have the right to reasonable access to dental services.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11.sp,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
