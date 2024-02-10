import 'package:flutter/material.dart';
import 'package:flutter_chat_app/core/app_route/app_route.dart';
import 'package:flutter_chat_app/view/screen/sign_up_screen/sign_up_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/sign_in_controller.dart';
import '../../../utils/colors/app_colors.dart';
import '../../widget/button/custom_button.dart';
import '../../widget/loading/loading.dart';
import '../../widget/text/custom_text.dart';
import 'inner_widget/sign_in_all_filed.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final formKey = GlobalKey<FormState>();

  SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Form(
              // key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogInFiled(),
                  Column(
                    children: [
                      Obx(
                        () => Center(
                          child: signInController.isLoading.value
                              ? LoadingContainer()
                              : CustomButton(
                                  titleText: "Sign In".tr,
                                  buttonRadius: 12.r,
                                  buttonWidth: double.infinity,
                                  onPressed: () {
                                    // if (formKey.currentState!.validate()) {
                                    signInController.firebaseLogIn();
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
                              text: "Don’t have an account? ".tr,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          GestureDetector(
                              onTap: () => Get.toNamed(AppRoute.signUp),
                              child: CustomText(
                                text: "Sign up".tr,
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
