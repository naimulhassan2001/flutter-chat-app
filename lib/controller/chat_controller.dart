import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/models/message.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController messageController = TextEditingController();

  Future<void> sendMessage(String receiverID) async {
    final currentUserID = firebaseAuth.currentUser!.uid;
    final currentUserEmail = firebaseAuth.currentUser!.email;
    final timestamp = Timestamp.now();

    try {
      List<String> ids = [currentUserID, receiverID];
      ids.sort();

      String chatRoomID = ids.join("_");

      await firebaseFirestore
          .collection("chat_room")
          .doc(chatRoomID)
          .collection("message")
          .add({
        "senderId": currentUserID,
        "senderEmail": currentUserEmail!,
        "receiverId": receiverID,
        "message": messageController.text,
        "Timestamp": timestamp
      });

      messageController.clear() ;
    } catch (e) {
      print("====================> error $e");
    }
  }

  Stream<QuerySnapshot> getMessage(userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();

    String chatRoomID = ids.join("_");

    return firebaseFirestore
        .collection("chat_room")
        .doc(chatRoomID)
        .collection("message")
        .orderBy("Timestamp", descending: false)
        .snapshots();
  }
}
