import '../../../../../../core/class/custom_divider.dart';
import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/constants/route_manager.dart';
import '../../../../../../core/functions/navigation/to_named.dart';
import '../../../../data/models/delivey_account_model.dart';
import '../../../view_model/deliveries_cubit/deliveries_accounts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';


// ignore: must_be_immutable
class CustomDeliveryAccountItem extends StatelessWidget {
  CustomDeliveryAccountItem({super.key, required this.deliveryData});

  DeliveryData deliveryData;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Delivery ID: ${deliveryData.deliveryId}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                InkWell(
                  onTap: () {
                    toNamed(
                      context,
                      RouteManager.editDeliveryAccount,
                      arguments: {'deliveryAccountData': deliveryData},
                    );
                  },
                  child: const Icon(
                    Icons.edit,
                  ),
                ),
              ],
            ),
            customDivider(vertical: 5),
            Text(
              'Delivery Name: ${deliveryData.deliveryName}',
              maxLines: 3,
              style:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.2),
            ),
            Text(
              'Delivery Email: ${deliveryData.deliveryEmail}',
              maxLines: 3,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 1.4,
                  ),
            ),
            Text(
              'Delivery Phone: ${deliveryData.deliveryPhone}',
              maxLines: 3,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 1.4,
                  ),
            ),
            Text(
              'Delivery Password: ${deliveryData.deliveryPassword}',
              maxLines: 3,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 1.4,
                  ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    showPlatformDialog(
                      context: context,
                      builder: (context) => BasicDialogAlert(
                        title: Text(
                          "Alert!",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        content: Text(
                          "Deleting the account will delete all records associated with it. are you sure about that ?",
                          maxLines: 5,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    height: 1.2,
                                  ),
                        ),
                        actions: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: ColorsManager.black,
                            ),
                            child: BasicDialogAction(
                              title: const Text(
                                "Cancel",
                                style: TextStyle(
                                  color: ColorsManager.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: ColorsManager.primary,
                            ),
                            child: BasicDialogAction(
                              title: const Text(
                                "Confirm",
                                style: TextStyle(
                                  color: ColorsManager.white,
                                ),
                              ),
                              onPressed: () {
                                DeliveriesAccountsCubit.get(context)
                                    .deleteAdminAccount(
                                  context,
                                  deliveryData.deliveryId!,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorsManager.red,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 7),
                      child: Text(
                        'Delete',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorsManager.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
