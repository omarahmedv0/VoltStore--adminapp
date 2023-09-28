import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomBottonControlBoard extends StatelessWidget {
   CustomBottonControlBoard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap
  });

String image;
String title;
Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Image.asset(
             image,
              width: 70.w,
              height: 70.h,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ]),
        ),
      ),
    );
  }
}
