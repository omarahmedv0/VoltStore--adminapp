import '../../../../../core/constants/colors_manager.dart';
import '../../../data/models/coupon_model.dart';
import '../../view_model/coupons_cubit/coupons_cubit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCouponItem extends StatelessWidget {
  CustomCouponItem({
    super.key,
    required this.couponData,
  });

  CouponData couponData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorsManager.grey,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Coupon Name: ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(height: 1.4),
                      ),
                      Text(
                        couponData.couponName!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.4),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Discount: ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(height: 1.4),
                      ),
                      Text(
                        '${couponData.couponDiscount}%',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.4),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Count: ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(height: 1.4),
                      ),
                      Text(
                        couponData.couponCount!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.4),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Expire Date: ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(height: 1.4),
                      ),
                      Text(
                        couponData.couponExpiredata!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.4),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Status: ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(height: 1.4),
                      ),
                      Text(
                        couponData.couponCount != '0'
                            ? DateTime.now().isBefore(DateTime.parse(
                                    couponData.couponExpiredata!))
                                ? 'valid'
                                : 'Expired'
                            : 'Expired',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              height: 1.4,
                              color: couponData.couponCount != '0'
                                  ? DateTime.now().isBefore(DateTime.parse(
                                          couponData.couponExpiredata!))
                                      ? ColorsManager.green
                                      : ColorsManager.red
                                  : ColorsManager.red,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          CouponsCubit.get(context).deleteCoupon(
                            context,
                            couponData.couponId!,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorsManager.red,
                              borderRadius: BorderRadius.circular(
                                30,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 1),
                            child: Text(
                              'Delete',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: ColorsManager.white,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
