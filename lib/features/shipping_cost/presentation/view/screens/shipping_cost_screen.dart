import '../../../../../core/class/handling/handling_state_view.dart';
import '../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../widgets/custom_shipping_cost_item.dart';
import '../../view_model/shipping_cost_cubit/shipping_cost_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ShippingCostScreen extends StatelessWidget {
  const ShippingCostScreen({super.key});

  get separatorBuilder => null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShippingCostCubit, ShippingCostState>(
      builder: (context, state) {
        ShippingCostCubit cubit = ShippingCostCubit.get(context);
        return SafeArea(
            child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              toNamed(
                context,
                RouteManager.addShippingCost,
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
                title: 'Shipping Costs',
                ispadding: true,
                isleading: true,
                onTap: () {
                  pop(context);
                },
              ),
              ConditionalBuilder(
                condition: state is GetShippingCostLoading,
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
                fallback: (context) => HandlingStateView(
                  conditionLoading: state is GetShippingCostLoading,
                  conditionEmpty: cubit.shippingCostModel!.data!.isEmpty,
                  conditionError: state is GetShippingCostFailere,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              CustomShippingCostItem(
                            cityNameAr: cubit
                                .shippingCostModel!.data![index].cityNameAr!,
                            cityNameEn: cubit
                                .shippingCostModel!.data![index].cityNameEn!,
                            cost: cubit
                                .shippingCostModel!.data![index].shippingCost!,
                            delete: () {
                              cubit.deleteShippingCost(
                                context,
                                cubit.shippingCostModel!.data![index].id!,
                              );
                            },
                          ),
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: cubit.shippingCostModel!.data!.length,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
