import 'package:flutter/material.dart';

import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_card_navigation.dart';
import '../../view_model/admins_cubit/admins_accounts_cubit.dart';
import '../../view_model/deliveries_cubit/deliveries_accounts_cubit.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            CustomAppBar(
              title: 'Accounts',
              ispadding: true,
              isleading: true,
              onTap: () {
                pop(context);
              },
            ),
            CustomCardNavigation(
              onTap: () {
                AdminsAccountsCubit.get(context)
                    .getAdminsAccounts()
                    .then((value) {
                  toNamed(
                    context,
                    RouteManager.adminsAccounts,
                  );
                });
              },
              text: 'Admins Accounts',
            ),
            CustomCardNavigation(
              onTap: () {
                DeliveriesAccountsCubit.get(context)
                    .getDeliveriesAccounts()
                    .then((e) {
                  toNamed(
                    context,
                    RouteManager.deliveriesAccounts,
                  );
                });
              },
              text: 'Deliveries Accounts',
            ),
          ],
        ),
      ),
    );
  }
}
