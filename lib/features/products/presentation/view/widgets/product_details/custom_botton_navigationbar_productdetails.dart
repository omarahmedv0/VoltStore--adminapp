import '../../../../../../core/constants/colors_manager.dart';
import '../../../../data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomBottonNavigationbarProductDetails extends StatelessWidget {
  CustomBottonNavigationbarProductDetails({
    super.key,
    required this.productDetails,
  });

  ProductData productDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14, left: 14, top: 10, bottom: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Price',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12,
                    ),
              ),
              Text(
                '\$${productDetails.productOldprice!}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.2,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: ColorsManager.black,
                    ),
              ),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Discount',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12,
                    ),
              ),
              Text(
                '% ${productDetails.productDescount!}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.2,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: ColorsManager.black,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Count',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12,
                    ),
              ),
              Text(
                productDetails.productCount!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.2,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: ColorsManager.black,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
