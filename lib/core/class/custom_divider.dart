import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors_manager.dart';

Widget customDivider({
  Color? color,
  double? size,
  double? vertical,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: vertical ?? 10.h,
    ),
    height: size ?? .5,
    color: color ?? ColorsManager.black.withOpacity(.4),
  );
}
