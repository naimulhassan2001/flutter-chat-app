import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/view/screen/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> firebaseSignUp() async {
    print("called");
    isLoading.value = true;

    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        await firebaseFirestore.collection("users").doc(value.user!.uid).set({
          "name": nameController.text,
          "email": emailController.text,
          "uid": value.user!.uid,
        });

        isLoading.value = false;

        Get.offAll(SignInScreen());
      });

      print("success");
    } catch (e) {
      isLoading.value = false;

      print("Error");
    }
  }
}
