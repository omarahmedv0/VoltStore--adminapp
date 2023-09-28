import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import '../../../../../../core/class/custom_divider.dart';
import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/constants/route_manager.dart';
import '../../../../../../core/functions/navigation/to_named.dart';
import '../../../../data/models/admin_account_model.dart';
import '../../../view_model/admins_cubit/admins_accounts_cubit.dart';

// ignore: must_be_immutable
class CustomAdimnAccountItem extends StatelessWidget {
  CustomAdimnAccountItem({super.key, required this.adminData});

  AdminData adminData;
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
                    'Admin ID: ${adminData.adminId}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                InkWell(
                  onTap: () {
                    toNamed(
                      context,
                      RouteManager.editAdminAccount,
                      arguments: {'adminAccountData': adminData},
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
              'Admin Name: ${adminData.adminName}',
              maxLines: 3,
              style:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.2),
            ),
            Text(
              'Admin Email: ${adminData.adminEmail}',
              maxLines: 3,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 1.4,
                  ),
            ),
            Text(
              'Admin Phone: ${adminData.adminPhone}',
              maxLines: 3,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 1.4,
                  ),
            ),
            Text(
              'Admin Password: ${adminData.adminPassword}',
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
                                showPlatformDialog(
                                  context: context,
                                  builder: (context) => BasicDialogAlert(
                                    title: Text(
                                      "Alert!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    content: Text(
                                      "Deleting the account will delete all records associated with it. are you sure about that ?",
                                      maxLines: 5,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            height: 1.2,
                                          ),
                                    ),
                                    actions: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
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
                                          borderRadius:
                                              BorderRadius.circular(25),
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
                                            AdminsAccountsCubit.get(context)
                                                .deleteAdminAccount(
                                              context,
                                              adminData.adminId!,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
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
