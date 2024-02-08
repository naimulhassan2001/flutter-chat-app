import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controller/home_controller.dart';
import 'package:flutter_chat_app/models/user_model.dart';
import 'package:get/get.dart';

import '../chat_screen/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => HomeController().firebaseSignOut(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(() => ListView.builder(
          itemCount: homeController.userList.length,
          itemBuilder: (context, index) {
            UserModel user = homeController.userList[index];

            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              onTap: () {
                Get.to(ChatScreen(
                  receiverUserEmail: user.email,
                  receiverUserID: user.id,
                  receiverUserName: user.name,
                ));
              },
              // Add more details or actions as needed
            );
          })),
    );
  }
}
