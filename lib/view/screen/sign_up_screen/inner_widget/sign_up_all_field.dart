import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controller/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../widget/text/custom_text.dart';

class SignUpAllField extends StatelessWidget {
  SignUpAllField({super.key});

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Create a New Account".tr,
          fontSize: 20.sp,
          top: 48.h,
          fontWeight: FontWeight.w600,
        ),
        CustomText(
            text: "Name".tr,
            fontSize: 14.sp,
            bottom: 4.h,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.start,
            top: 27.h),
        TextFormField(
          controller: signUpController.nameController,
          decoration: const InputDecoration(labelText: "Name"),
        ),
        CustomText(
            text: "Email".tr,
            fontSize: 14.sp,
            bottom: 4.h,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.start,
            top: 27.h),

        TextFormField(
          controller: signUpController.emailController,
          decoration: const InputDecoration(labelText: "Email"),
        ),

        CustomText(
            text: "Password".tr,
            fontSize: 14.sp,
            bottom: 4.h,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.start,
            top: 22.h),
        TextFormField(
          controller: signUpController.passwordController,
          decoration: const InputDecoration(labelText: "Password"),
        ),
        CustomText(
            text: "Confirm Password".tr,
            fontSize: 14.sp,
            bottom: 4.h,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.start,
            top: 27.h),

        TextFormField(
          controller: signUpController.confirmPasswordController,
          decoration: const InputDecoration(labelText: "Confirm Password"),
        ),
        SizedBox(height: 80.h,)
      ],
    );
  }
}
