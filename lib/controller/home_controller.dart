import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/core/app_route/app_route.dart';
import 'package:flutter_chat_app/view/screen/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class HomeController extends GetxController {
  RxList userList = [].obs;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    firebaseFetchUserList() ;
    super.onInit();
  }

  Future<void> firebaseFetchUserList() async {
    final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

    try {
      QuerySnapshot data = await firebaseFireStore.collection("users").get();

      data.docs.forEach((DocumentSnapshot document) {
        if (firebaseAuth.currentUser!.email != document['email']) {
          userList
              .add(UserModel(name: document['name'], email: document['email'], id: document["uid"]));
        }
      });

      print("success");
      print("=======================. $userList");
    } catch (e) {
      print("error");
    }
  }


  Future<void> firebaseSignOut() async {
    final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

    try {
      firebaseAuth.signOut() ;
      Get.toNamed(AppRoute.signIn) ;
    }catch (e) {
      print(" ====================> error $e") ;
    }

  }
}
