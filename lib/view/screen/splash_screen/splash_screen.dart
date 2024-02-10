
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controller/home_controller.dart';
import 'package:flutter_chat_app/core/app_route/app_route.dart';
import 'package:flutter_chat_app/view/screen/sign_in_screen/sign_in_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // HomeController homeController = Get.put(HomeController()) ;

  @override
  void initState() {

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoute.signIn) ;
    }) ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Flutter Chat App", style: TextStyle(fontSize: 20.sp),))
        ],
      ),
    ) ;
  }
}
