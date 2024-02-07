import 'package:flutter/material.dart';
import 'package:flutter_chat_app/controller/home_controller.dart';
import 'package:flutter_chat_app/models/user_model.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
          itemCount: homeController.userList.length,
          itemBuilder: (context, index) {
            UserModel user = homeController.userList[index];

            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              // Add more details or actions as needed
            );
          })),
    );
  }
}
