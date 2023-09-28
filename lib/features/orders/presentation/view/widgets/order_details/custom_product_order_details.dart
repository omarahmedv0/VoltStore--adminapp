// ignore_for_file: unrelated_type_equality_checks, must_be_immutable


import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/core/constants/colors_manager.dart';
import 'package:adminapp/features/orders/data/models/order_details_model/product_details_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductItemOrderDetails extends StatelessWidget {
  CustomProductItemOrderDetails({
    super.key,
    required this.orderDetailsData,
    required this.orderStatus,
    required this.orderID,
  });
  ProductsDetailsMyorder orderDetailsData;
  String orderStatus;
  String orderID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(
                        '${ApiLinks.productsImagesLink}/${orderDetailsData.productImage}',
                        height: 100.w,
                        width: 100.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.7,
                                child: Text(
                                  orderDetailsData.productNameEn!,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        overflow: TextOverflow.ellipsis,
                                        height: 1.2,
                                      ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Quantity',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontSize: 13.sp,
                                          color:
                                              ColorsManager.black.withOpacity(
                                            .6,
                                          ),
                                        ),
                                  ),
                                  Text(
                                    orderDetailsData.countitems!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontSize: 10.sp,
                                          height: 1,
                                          color: ColorsManager.black
                                              .withOpacity(.6),
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width /2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\$ ${orderDetailsData.newprice}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: ColorsManager.black,
                                            fontWeight: FontWeight.w900,
                                            height: 1.5,
                                            fontSize: 14.sp,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    if (orderDetailsData.productDescount != '0')
                                      Text(
                                        '\$ ${(int.parse(orderDetailsData.productOldprice!) * int.parse(orderDetailsData.countitems!))}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: ColorsManager.black
                                                  .withOpacity(.6),
                                              fontWeight: FontWeight.w500,
                                              height: 1.5,
                                            ),
                                      ),
                                  ],
                                ),
                                
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
