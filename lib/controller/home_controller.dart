import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              .add(UserModel(name: document['name'], email: document['email']));
        }
      });

      print("success");
      print("=======================. $userList");
    } catch (e) {
      print("error");
    }
  }
}
