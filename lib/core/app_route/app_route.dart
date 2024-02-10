
import 'package:flutter_chat_app/view/screen/chat_screen/chat_screen.dart';
import 'package:flutter_chat_app/view/screen/home/home_screen.dart';
import 'package:flutter_chat_app/view/screen/sign_in_screen/sign_in_screen.dart';
import 'package:flutter_chat_app/view/screen/sign_up_screen/sign_up_screen.dart';
import 'package:flutter_chat_app/view/screen/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String chat = "/chat_screen.dart";
  static const String home = "/home_screen.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String splash = "/splash_screen.dart";


  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: chat, page: () => ChatScreen()),

  ];
}