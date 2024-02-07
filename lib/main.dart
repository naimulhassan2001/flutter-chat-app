import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/theme/light_theme.dart';
import 'package:flutter_chat_app/view/screen/home/home_screen.dart';
import 'package:flutter_chat_app/view/screen/sign_up_screen/sign_up_screen.dart';
import 'package:flutter_chat_app/view/screen/splash_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'view/screen/sign_in_screen/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            theme: lightTheme,
            // home: SignInScreen(),
            // home: SignUpScreen(),
            home: SplashScreen(),
          );
        });
  }
}
