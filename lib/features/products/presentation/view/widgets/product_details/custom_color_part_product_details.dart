import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/functions/check_product_color.dart';
import '../../../view_model/product_details_cubit/product_details_cubit.dart';

// ignore: must_be_immutable
class CustomColorPartProductDetails extends StatelessWidget {
  CustomColorPartProductDetails({
    super.key,
    required this.colorsName,
  });

  List<String> colorsName;

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(
                  0.3,
                ),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(
                  0,
                  3,
                ), // changes position of shadow
              ),
            ],
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(
              180,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 17.w,
              vertical: 10.h,
            ),
            child: Row(
              children: [
                ...List.generate(
                  colorsName.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(
                            0.2,
                          ),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(
                            0,
                            3,
                          ), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                      ),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: checkProductColor(
                          ProductDetailsCubit.get(context).productColors[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
