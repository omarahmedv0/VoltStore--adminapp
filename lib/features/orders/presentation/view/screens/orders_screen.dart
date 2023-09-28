import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_card_navigation.dart';
import '../../view_model/orders_pending_cubit/orders_pending_cubit.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          CustomAppBar(
            title: 'Orders',
            ispadding: true,
            isleading: true,
            onTap: () {
              pop(context);
            },
          ),
          CustomCardNavigation(
            onTap: () {
              OrdersPendingCubit.get(context)
                  .getOrdersPendingData()
                  .then((value) {
                OrdersPendingCubit.get(context).getDeliveryID().then(
                  (value) {
                    OrdersPendingCubit.get(context).setDeliveryIdList();
                  },
                );
              });
              toNamed(
                context,
                RouteManager.ordersApproval,
              );
            },
            text: 'Orders awaiting approval',
          ),
          CustomCardNavigation(
            onTap: () {
              toNamed(
                context,
                RouteManager.ordersPrepared,
              );
            },
            text: 'Orders are being prepared',
          ),
          CustomCardNavigation(
            onTap: () {
              toNamed(
                context,
                RouteManager.ordersDelivery,
              );
            },
            text: 'Orders are in the shipping stage',
          ),
          CustomCardNavigation(
            onTap: () {
              toNamed(
                context,
                RouteManager.ordersReceived,
              );
            },
            text: 'Orders Received',
          ),
        ],
      ),
    ));
  }
}
