import '../../../../../core/class/custom_divider.dart';
import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_category_product_item_view.dart';
import '../../view_model/product_details_cubit/product_details_cubit.dart';
import '../../view_model/products_view_cubit/products_view_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsViewCubit, ProductsViewState>(
      builder: (context, state) {
        ProductsViewCubit cubit = ProductsViewCubit.get(context);
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                toNamed(
                  context,
                  RouteManager.addProduct,
                );
              },
              child: const Icon(
                Icons.add,
              ),
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomAppBar(
                  title: 'Products',
                  ispadding: true,
                  isleading: true,
                  onTap: () {
                    pop(context);
                  },
                ),
                ConditionalBuilder(
                  condition: state is GetProductsDataLoading,
                  builder: (context) => Column(
                    children: [
                      Center(
                        child: Lottie.asset(
                          LottieAssetsManager.loading,
                          width: 300,
                          height: 450,
                        ),
                      ),
                    ],
                  ),
                  fallback: (context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            ProductDetailsCubit.get(context)
                                .getProductColors(cubit
                                    .productsModel!.data![index].productId!)
                                .then((s) {
                              ProductDetailsCubit.get(context)
                                  .getProductSize(cubit
                                      .productsModel!.data![index].productId!)
                                  .then((value) {
                                toNamed(context, RouteManager.productsDetails,
                                    arguments: {
                                      'productDetails':
                                          cubit.productsModel!.data![index],
                                    });
                              });
                            });
                          },
                          child: CustomCategoryandProductItem(
                            date: cubit
                                .productsModel!.data![index].productTimeCreate!,
                            deleteFun: () {
                              cubit.deleteProduct(
                                cubit.productsModel!.data![index].productId!,
                                cubit.productsModel!.data![index].productImage!,
                              );
                            },
                            editFun: () {
                              toNamed(context, RouteManager.editProduct,
                                  arguments: {
                                    'productData':
                                        cubit.productsModel!.data![index],
                                  });
                            },
                            image:
                                "${ApiLinks.productsImagesLink}/${cubit.productsModel!.data![index].productImage}",
                            titleEN: cubit
                                .productsModel!.data![index].productNameEn!,
                            titleAR: cubit
                                .productsModel!.data![index].productNameAr!,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return customDivider();
                      },
                      itemCount: cubit.productsModel!.data!.length,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
