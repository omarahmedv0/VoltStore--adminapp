import '../../../../../../core/constants/colors_manager.dart';
import '../../../../data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomDescPartProductDetails extends StatelessWidget {
  const CustomDescPartProductDetails({
    super.key,
    required this.productDetails,
  });

  final ProductData productDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descraption',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
         productDetails.productDescEn!,
          maxLines: 100,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorsManager.black.withOpacity(.7),
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,),
        ),
      ],
    );
  }
}
