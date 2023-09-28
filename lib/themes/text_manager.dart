import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors_manager.dart';

TextTheme textManager() {
  return TextTheme(
      titleMedium: TextStyle(
        color: ColorsManager.black,
        fontWeight: FontWeight.w800,
        fontSize: 25.sp,
        overflow: TextOverflow.ellipsis,
      ),
      titleSmall: TextStyle(
        
        height: 1.5,
        color: ColorsManager.black,
        fontWeight: FontWeight.w800,
        fontSize: 20.sp,
        overflow: TextOverflow.ellipsis,
      ),
      titleLarge: TextStyle(
        color: ColorsManager.black,
        fontWeight: FontWeight.w800,
        fontSize: 28.sp,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
        height: 2,
        color: ColorsManager.black.withOpacity(.6),
        overflow: TextOverflow.ellipsis,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
        height: 2,
        color: ColorsManager.grey,
        overflow: TextOverflow.ellipsis,
      ),
      labelMedium: TextStyle(
        color: ColorsManager.grey,
        fontWeight: FontWeight.normal,
        fontSize: 15.sp,
        overflow: TextOverflow.ellipsis,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black.withOpacity(.6),
        fontSize: 15.sp,
        overflow: TextOverflow.ellipsis,
      ),
      labelSmall: TextStyle(
        color: ColorsManager.black,
        fontWeight: FontWeight.normal,
        fontSize: 15.sp,
        overflow: TextOverflow.ellipsis,
      ));
}
