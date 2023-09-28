import '../../../../../core/class/custom_divider.dart';
import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_category_product_item_view.dart';
import '../../view_model/categories_view_cubit/categories_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        CategoriesCubit cubit = CategoriesCubit.get(context);
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                toNamed(
                  context,
                  RouteManager.addCat,
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
                  title: 'Categories',
                  ispadding: true,
                  isleading: true,
                  onTap: () {
                    pop(context);
                  },
                ),
                ConditionalBuilder(
                  condition: state is GetCatgoriesDataLoading,
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
                        return CustomCategoryandProductItem(
                          date: cubit
                              .categoryModel!.catData[index].categoryTimeCreate!,
                          deleteFun: () {
                            cubit.deleteCategory(
                              context,
                              cubit.categoryModel!.catData[index].categoryId!,
                              cubit.categoryModel!.catData[index].image!,
                            );
                          },
                          editFun: () {
                            toNamed(context, RouteManager.editCat, arguments: {
                              'catData': cubit.categoryModel!.catData[index],
                            });
                          },
                          image:
                              "${ApiLinks.categoriesImageLink}/${cubit.categoryModel!.catData[index].image}",
                          titleEN:
                              cubit.categoryModel!.catData[index].categoryNameEn!,
                          titleAR:
                              cubit.categoryModel!.catData[index].categoryNameAr!,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return customDivider();
                      },
                      itemCount: cubit.categoryModel!.catData.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
