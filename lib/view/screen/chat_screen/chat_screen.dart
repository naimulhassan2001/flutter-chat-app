import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controller/chat_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUserID,
    required this.receiverUserName,
  });

  final String receiverUserEmail;
  final String receiverUserID;
  final String receiverUserName;

  ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverUserName),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
              stream: chatController.getMessage(
                  receiverUserID, chatController.firebaseAuth.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];

                      var alignment = data["senderEmail"] ==
                              chatController.firebaseAuth.currentUser!.email
                          ? Alignment.centerRight
                          : Alignment.centerLeft;

                      return Container(
                        alignment: alignment,
                        child: Column(
                          crossAxisAlignment: data["senderEmail"] ==
                                  chatController.firebaseAuth.currentUser!.email
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(data["senderEmail"]),
                            Text(data["message"]),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )),
            SizedBox(height: 16.h,),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: chatController.messageController,
                  decoration: const InputDecoration(labelText: "Enter Message"),
                )),
                IconButton(
                    onPressed: () => chatController.sendMessage(receiverUserID),
                    icon: const Icon(Icons.send))
              ],
            )
          ],
        ),
      ),
    );
  }
}
