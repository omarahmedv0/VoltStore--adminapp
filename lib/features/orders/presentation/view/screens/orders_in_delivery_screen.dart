import '../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../widgets/orders_screen/custom_order_item.dart';
import '../../view_model/orders_delivery_cubit/orders_indelivery_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class OrdersInDeliveryScreen extends StatelessWidget {
  const OrdersInDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersIndeliveryCubit, OrdersIndeliveryState>(
      builder: (context, state) {
        OrdersIndeliveryCubit cubit = OrdersIndeliveryCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: ListView(
              children: [
                CustomAppBar(
                  title: 'In Delivery',
                  ispadding: true,
                  isleading: true,
                  onTap: () {
                    pop(context);
                  },
                ),
                ConditionalBuilder(
                  condition: state is GetOrdersDeliveryLoading,
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
