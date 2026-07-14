import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:AURA/controller/screens_controller/support_controller.dart';
import 'package:AURA/view/widgets/elevated_button_app_custom.dart';
import 'package:AURA/view/widgets/text_app_custom.dart';
import 'package:AURA/view/widgets/text_form_faild_app_custom.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({super.key});

  final SupportController _supportController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("support.title".tr),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF5F7FA), Color(0xFFE4ECF5)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 10.h),

                  AppText.title(
                    "support.headline".tr,
                  ),

                   SizedBox(height: 6.h),

                   AppText.caption(
                   "support.subtitle".tr,
                  ),
                  SizedBox(height: 12.h),

                  /// Subject Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 5.r),
                        ),
                      ],
                    ),
                    child: CustomTextFormField(
                      controller: _supportController.subjectController,
                      hintText: "support.subject_hint".tr,
                      prefixIcon: Icon(Icons.title),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  /// Message Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10.r,
                          offset:  Offset(0, 5.r),
                        ),
                      ],
                    ),
                    child: CustomTextFormField(
                      controller: _supportController.messageController,
                      hintText: "support.message_hint".tr,
                      maxLines: 6,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only( top: 16.h,bottom: 140.h),
                        child: Icon(Icons.message),
                      ),
                    ),
                  ),
                  SizedBox(height: 92.h),

                  CustomElevatedButton(
                      text: _supportController.isLoading.value
                          ? "support.sending".tr
                          : "support.send_ticket".tr,
                      onPressed: _supportController.isLoading.value
                          ? null
                          : () {
                              _supportController.sendTicket();
                            },
                    ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
