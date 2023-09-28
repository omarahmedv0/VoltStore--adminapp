// ignore_for_file: must_be_immutable

import 'package:adminapp/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextSignupORlogin extends StatelessWidget {
   CustomTextSignupORlogin({
    super.key,
    required this.text1,
    required this.text2,
    this.fun
  });
  String text1;
  String text2;
Function()? fun;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        InkWell(
          onTap:fun ,
          child: Text(
            text2,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 14.sp, color: ColorsManager.primary),
          ),
        ),
      ],
    );
  }
}
