import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 14.w),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)
            )
        )
    )
);
