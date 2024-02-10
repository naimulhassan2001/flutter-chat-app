import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/core/app_route/app_route.dart';
import 'package:get/get.dart';

import '../view/screen/home/home_screen.dart';

class SignInController extends GetxController {
  RxBool isLoading = false.obs;

  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;



  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();


  Future<void> firebaseLogIn() async {
    isLoading.value = true ;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text) ;

      isLoading.value = false ;

      Get.offAllNamed(AppRoute.home) ;

    } catch (e) {
      isLoading.value = false ;

      print("======================>Error $e") ;
    }
  }
}
