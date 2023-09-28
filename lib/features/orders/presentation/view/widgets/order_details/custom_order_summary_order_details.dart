// ignore_for_file: must_be_immutable

import 'package:adminapp/core/constants/colors_manager.dart';
import 'package:adminapp/features/orders/data/models/order_details_model/order_details_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOredrSummaryOrderDetails extends StatelessWidget {
  CustomOredrSummaryOrderDetails({super.key, required this.orderDetails});
  MyorderDetails orderDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManager.grey,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.white,
              ),
              margin: const EdgeInsets.all(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Price :',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          '\$ ${orderDetails.orderSubprice}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: ColorsManager.black,
                                    height: 1.5,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Discount :',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          '\$ ${orderDetails.orderDiscount}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: ColorsManager.black,
                                    height: 1.5,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Shipping cost :',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          '\$ ${orderDetails.orderDeliveryprice}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: ColorsManager.black,
                                    height: 1.5,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      height: .5,
                      width: double.infinity,
                      color: ColorsManager.grey,
                    ),
                    Row(
                      children: [
                        Text(
                          'Total Price:',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.primary,
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          '\$ ${orderDetails.orderTotalprice}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: ColorsManager.black,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
