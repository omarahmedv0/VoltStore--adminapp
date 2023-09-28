import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../../core/constants/route_manager.dart';
import '../../../../../../core/functions/navigation/pop.dart';
import '../../../../../../core/functions/navigation/to_named.dart';
import '../../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../view_model/deliveries_cubit/deliveries_accounts_cubit.dart';
import '../../widgets/deliveries/custom_delivery_account_item.dart';

class DeliveriesAccountsScreen extends StatelessWidget {
  const DeliveriesAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveriesAccountsCubit, DeliveriesAccountsState>(
      builder: (context, state) {
        DeliveriesAccountsCubit cubit = DeliveriesAccountsCubit.get(context);
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                toNamed(
                  context,
                  RouteManager.addDeliveryAccount,
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
                  title: 'Deliveries Accounts',
                  ispadding: true,
                  isleading: true,
                  onTap: () {
                    pop(context);
                  },
                ),
                ConditionalBuilder(
                  condition: state is GetDeliveriesAccountsLoading,
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
                  fallback: (context) => ConditionalBuilder(
                    condition: cubit.deliveryAccountModel == null ||
                        cubit.deliveryAccountModel!.deleveryData.isEmpty,
                    builder: (context) => Center(
                        child: Lottie.asset(LottieAssetsManager.empty,
                            width: 250, height: 450)),
                    fallback: (context) => ConditionalBuilder(
                      condition: state is GetDeliveriesAccountsFailere,
                      builder: (context) => Column(
                        children: [
                          Center(
                              child: Lottie.asset(
                            LottieAssetsManager.error,
                            width: 500,
                            height: 500,
                          )),
                        ],
                      ),
                      fallback: (context) => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.deliveryAccountModel!.deleveryData.length,
                        itemBuilder: (context, index) =>
                            CustomDeliveryAccountItem(
                          deliveryData: cubit.deliveryAccountModel!.deleveryData[index],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
