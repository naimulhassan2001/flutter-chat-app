import 'package:flutter/material.dart';
import 'package:flutter_chat_app/view/screen/sign_up_screen/inner_widget/sign_up_all_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/sign_up_controller.dart';
import '../../../utils/colors/app_colors.dart';
import '../../widget/button/custom_button.dart';
import '../../widget/loading/loading.dart';
import '../../widget/text/custom_text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SignUpAllField(),
                  Column(
                    children: [
                      Obx(
                        () => Center(
                          child: signUpController.isLoading.value
                              ? LoadingContainer()
                              : CustomButton(
                                  titleText: "Sign Up".tr,
                                  buttonRadius: 12.r,
                                  buttonWidth: double.infinity,
                                  onPressed: () {
                                    signUpController.firebaseSignUp();
                                  }),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: CustomText(
                              text: "Already have account".tr,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          GestureDetector(
                              // onTap: () => Get.toNamed(AppRoute.createAccount),
                              child: CustomText(
                            text: "Sign In".tr,
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ))
                        ],
                      ),
                    ],
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
