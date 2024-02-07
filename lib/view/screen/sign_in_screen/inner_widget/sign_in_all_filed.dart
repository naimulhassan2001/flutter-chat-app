import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/sign_in_controller.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../widget/text/custom_text.dart';

class LogInFiled extends StatelessWidget {
  LogInFiled({super.key});

  SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Get started with Russend".tr,
          fontSize: 20.sp,
          top: 28.h,
          fontWeight: FontWeight.w600,
        ),
        CustomText(
            text: "Email".tr,
            fontSize: 14.sp,
            bottom: 4.h,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.start,
            top: 27.h),
        TextFormField(
          controller: signInController.emailController,
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
          controller: signInController.passwordController,
          decoration: const InputDecoration(labelText: "Password"),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            // onTap: () => Get.toNamed(AppRoute.forgotPassword),
            child: CustomText(
              text: "Forgot password".tr,
              textAlign: TextAlign.end,
              fontSize: 10.sp,
              color: AppColors.primaryColor,
              right: 8.w,
              top: 12.w,
              bottom: 200.h,
            ),
          ),
        ),
      ],
    );
  }
}
