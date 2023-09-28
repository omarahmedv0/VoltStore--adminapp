import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/constants/route_manager.dart';
import '../../../../../../core/functions/check_status_order.dart';
import '../../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../../core/functions/navigation/to_named.dart';
import '../../../../data/models/order_model.dart';
import '../pending_screen/custom_drop_down_pending.dart';
import '../../../view_model/order_details_cubit/order_details_cubit.dart';
import '../../../view_model/orders_pending_cubit/orders_pending_cubit.dart';
import '../../../view_model/orders_prepared_cubit/orders_prepared_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: must_be_immutable
class CustomOrderItem extends StatelessWidget {
  CustomOrderItem({super.key, required this.orderData});
  OrderData orderData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order #${orderData.orderId}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20.sp, height: 1),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: .5,
              color: ColorsManager.black.withOpacity(.4),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'SubPrice: ${orderData.orderSubprice} \$',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.black,
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Text(
              'Delivery Price: ${orderData.orderDeliveryprice} \$',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.black,
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Text(
              'Payment Method: ${orderData.orderPaymentmethod}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.black,
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            if (orderData.status == '2' || orderData.status == '3')
              Text(
                'Status: ${checkStatusOrder(orderData.status!)}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.black,
                      height: 1.5,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            SizedBox(
              height: 10.h,
            ),
            if (orderData.status == '0')
              Column(
                children: [
                  const CustomDropBottonPending(),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            InkWell(
              onTap: () async {
                OrderDetailsCubit.get(context)
                    .getOrderDetailsData(orderData.orderId!)
                    .then((value) {
                  OrderDetailsCubit.get(context).getCities();
                  toNamed(
                    context,
                    RouteManager.orderDetails,
                  );
                });
              },
              child: Container(
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  color: ColorsManager.black,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Total Price: ${orderData.orderTotalprice}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorsManager.white, fontSize: 17.sp),
                    ),
                    const Spacer(),
                    Container(
                      width: 100.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        color: ColorsManager.primary,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'View Details',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: ColorsManager.white,
                                      fontSize: 15.sp),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            if (orderData.status == '0' || orderData.status == '1')
              InkWell(
                onTap: () async {
                  if (orderData.status == '0') {
                    if (OrdersPendingCubit.get(context).deleviryIDSelected ==
                        null) {
                      customSnackBar(
                        context,
                        'Please Select Delivery man ID',
                        AnimatedSnackBarType.info,
                        300,
                      );
                    } else {
                      OrdersPendingCubit.get(context).approveOrder(
                          orderData.orderId!, orderData.orderUserid!, context);
                    }
                  } else if (orderData.status == '1') {
                    OrdersPreparedCubit.get(context).preparedOrder(
                        orderData.orderId!, orderData.orderUserid!, context);
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorsManager.orange,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          orderData.status == '1' ? 'Prepared' : 'Approve',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 13.sp,
                                    color: ColorsManager.white,
                                  ),
                        ),
                      ]),
                ),
              ),
            if (orderData.status == '0')
              InkWell(
                onTap: () async {
                  OrdersPendingCubit.get(context).cancelOrder(
                    orderData.orderId!,
                    orderData.orderUserid!,
                    context,
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: 10.h,
                  ),
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorsManager.red,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Cancel',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 13.sp,
                                    color: ColorsManager.white,
                                  ),
                        ),
                      ]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
