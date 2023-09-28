// ignore_for_file: avoid_print
import 'package:adminapp/features/products/presentation/view/widgets/product_details/custom_botton_navigationbar_productdetails.dart';
import 'package:adminapp/features/products/presentation/view/widgets/product_details/custom_color_part_product_details.dart';
import 'package:adminapp/features/products/presentation/view/widgets/product_details/custom_desc_part_product_details.dart';
import 'package:adminapp/features/products/presentation/view/widgets/product_details/custom_size_part_products_details.dart';
import 'package:adminapp/features/products/presentation/view/widgets/product_details/custom_sliver_appbar_products_details.dart';
import 'package:adminapp/features/products/presentation/view_model/product_details_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors_manager.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        var cubit = ProductDetailsCubit.get(context);
        cubit.initialData(context);
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: CustomBottonNavigationbarProductDetails(
              productDetails: cubit.productDetails!,
            ),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              slivers: [
                CustomSliverAppbarProductDetails(
                  productDetails: cubit.productDetails!,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        padding: const EdgeInsets.only(
                          right: 14,
                          left: 14,
                          top: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: ColorsManager.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        
                            Text(
                              'Size',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Row(
                              children: [
                                CustomSizePartProductDetails(
                                  size: cubit.productSize,
                                ),
                                const Spacer(),
                                CustomColorPartProductDetails(
                                  colorsName: cubit.productColors,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomDescPartProductDetails(
                              productDetails: cubit.productDetails!,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
