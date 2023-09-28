import '../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../widgets/orders_screen/custom_order_item.dart';
import '../../view_model/orders_prepared_cubit/orders_prepared_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class OrdersPreparedScreen extends StatelessWidget {
  const OrdersPreparedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersPreparedCubit, OrdersPreparedState>(
      builder: (context, state) {
        OrdersPreparedCubit cubit = OrdersPreparedCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: ListView(
              children: [
                CustomAppBar(
                  title: 'Prepared',
                  ispadding: true,
                  isleading: true,
                  onTap: () {
                    pop(context);
                  },
                ),
                 ConditionalBuilder(
                  condition: state is GetOrdersPreparedLoading,
                  builder: (context) {
                    return Column(
                      children: [
                        Center(
                          child: Lottie.asset(
                            LottieAssetsManager.loading,
                            width: 300,
                            height: 450,
                          ),
                        ),
                      ],
                    );
                  },
                  fallback: (context) => ConditionalBuilder(
                    condition: cubit.orderModel!.data!.isEmpty,
                    builder: (context) => Column(
                      children: [
                        Center(
                          child: Lottie.asset(
                            LottieAssetsManager.empty,
                            width: 300,
                            height: 450,
                          ),
                        ),
                      ],
                    ),
                    fallback: (context) => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.orderModel!.data!.length,
                      itemBuilder: (context, index) => CustomOrderItem(
                        orderData: cubit.orderModel!.data![index],
                      ),
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
