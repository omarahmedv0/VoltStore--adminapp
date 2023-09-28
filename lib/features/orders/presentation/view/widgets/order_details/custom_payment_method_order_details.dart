
// ignore_for_file: must_be_immutable


import 'package:adminapp/core/constants/colors_manager.dart';
import 'package:adminapp/core/functions/check_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaymentMethodOrderDetails extends StatelessWidget {
   CustomPaymentMethodOrderDetails({
    super.key,
 required this.paymentMethod
  });
 String paymentMethod;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.attach_money_outlined,
                    color: ColorsManager.green,
                  ),
                  Text(
                   checkPaymentOrder(paymentMethod),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                            color: ColorsManager.black,
                            fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
