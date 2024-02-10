import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controller/chat_controller.dart';
import 'package:flutter_chat_app/controller/home_controller.dart';
import 'package:flutter_chat_app/core/app_route/app_route.dart';
import 'package:flutter_chat_app/models/user_model.dart';
import 'package:get/get.dart';

import '../chat_screen/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());
  ChatController chatController = Get.put(ChatController()) ;

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
                chatController.receiverUserEmail.value = user.email ;
                chatController.receiverUserID.value =  user.id ;
                chatController.receiverUserName.value = user.name ;

                print("===============================>receiverUserName ${ chatController.receiverUserName.value}") ;
                Get.toNamed(AppRoute.chat);
              },
              // Add more details or actions as needed
            );
          })),
    );
  }
}
