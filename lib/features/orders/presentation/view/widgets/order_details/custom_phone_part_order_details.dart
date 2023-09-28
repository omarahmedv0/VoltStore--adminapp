
// ignore_for_file: must_be_immutable
import 'package:adminapp/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPhoneNumberPartOrderDetails extends StatelessWidget {
   CustomPhoneNumberPartOrderDetails({
    super.key,
 required this.phoneNumber
  });
 String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Phone Number',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.check_circle,
                color: ColorsManager.green,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                phoneNumber,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.black.withOpacity(.8),
                      height: 1.5,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
