import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/models/message.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxString receiverUserEmail = "".obs;
  RxString receiverUserID = "".obs;
  RxString receiverUserName = "".obs;

  ScrollController scrollController = ScrollController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController messageController = TextEditingController();

  Future<void> sendMessage() async {

    final currentUserID = firebaseAuth.currentUser!.uid;
    final currentUserEmail = firebaseAuth.currentUser!.email;
    final timestamp = Timestamp.now();

    try {
      List<String> ids = [currentUserID, receiverUserID.value];
      ids.sort();

      String chatRoomID = ids.join("_");

      await firebaseFirestore
          .collection("chat_room")
          .doc(chatRoomID)
          .collection("message")
          .add({
        "senderId": currentUserID,
        "senderEmail": currentUserEmail!,
        "receiverId": receiverUserID.value,
        "message": messageController.text,
        "Timestamp": timestamp
      });

      messageController.clear();
    } catch (e) {
      print("====================> error $e");
    }
  }

  Stream<QuerySnapshot> getMessage() {

    List<String> ids = [receiverUserID.value, firebaseAuth.currentUser!.uid];
    ids.sort();

    String chatRoomID = ids.join("_");

    return firebaseFirestore
        .collection("chat_room")
        .doc(chatRoomID)
        .collection("message")
        .orderBy("Timestamp", descending: false)
        .snapshots();
  }


  timeFormat(int seconds, int nanoseconds) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        seconds * 1000 + nanoseconds ~/ 1e6,
        isUtc: true);

    String formattedTime = "${dateTime.toLocal()}";

    print(formattedTime);

    var time = formattedTime.split(" ")[1].split(".")[0];

    var hour = time.split(":")[0];
    var minute = time.split(":")[1];

    String period = int.parse(hour) >= 12 ? 'PM' : 'AM';
    int formattedHours = int.parse(hour) % 12 == 0 ? 12 : int.parse(hour) % 12;

    String formattedDuration =
        "$formattedHours:${(hour).toString().padLeft(2, '0')} $period";

    return formattedDuration;
  }
}
