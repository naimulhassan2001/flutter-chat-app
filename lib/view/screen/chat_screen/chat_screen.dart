import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controller/chat_controller.dart';
import 'package:flutter_chat_app/utils/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({
    super.key,
  });

  ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatController.receiverUserName.value),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
              stream: chatController.getMessage(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    reverse: true,
                    controller: chatController.scrollController,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];

                      var alignment = data["senderEmail"] ==
                              chatController.firebaseAuth.currentUser!.email
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start;

                      bool tail = data["senderEmail"] ==
                              chatController.firebaseAuth.currentUser!.email
                          ? true
                          : false;

                      // Timestamp timestamp = data["Timestamp"];
                      // var seconds = timestamp.seconds;
                      // var nanoseconds = timestamp.nanoseconds;

                      // chatController.aaa();



                      return Row(
                        mainAxisAlignment: alignment,
                        children: [
                          tail
                              ? const SizedBox()
                              : CircleAvatar(
                                  radius: 16,
                                  child: ClipOval(
                                      child: Image.network(
                                    "https://www.jugantor.com/assets/news_photos/2023/02/15/image-645374-1676455527.jpg",
                                    height: 32,
                                    width: 32,
                                    fit: BoxFit.fill,
                                  ))),
                          BubbleSpecialThree(
                            text: "${data["message"]}",
                            color: tail ? AppColors.blue : AppColors.gray,
                            tail: tail,
                            isSender: tail,
                            textStyle: tail
                                ? const TextStyle(
                                    color: Colors.white, fontSize: 16)
                                : const TextStyle(),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: chatController.messageController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      labelText: "Enter Message"),
                )),
                IconButton(
                    onPressed: () => chatController.sendMessage(),
                    icon: const Icon(Icons.send))
              ],
            )
          ],
        ),
      ),
    );
  }
}
