import '../../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../../core/constants/route_manager.dart';
import '../../../../../../core/functions/navigation/pop.dart';
import '../../../../../../core/functions/navigation/to_named.dart';
import '../../widgets/admin/custom_admin_account_item.dart';
import '../../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../view_model/admins_cubit/admins_accounts_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AdminsAccountsScreen extends StatelessWidget {
  const AdminsAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminsAccountsCubit, AdminsAccountsState>(
      builder: (context, state) {
        AdminsAccountsCubit cubit = AdminsAccountsCubit.get(context);
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                toNamed(
                  context,
                  RouteManager.addAdminAccount,
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
                  title: 'Admins Accounts',
                  ispadding: true,
                  isleading: true,
                  onTap: () {
                    pop(context);
                  },
                ),
                ConditionalBuilder(
                  condition: state is GetAdminsAccountsLoading,
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
                    condition: cubit.accountModel == null ||
                        cubit.accountModel!.data.isEmpty,
                    builder: (context) => Center(
                        child: Lottie.asset(LottieAssetsManager.empty,
                            width: 250, height: 450)),
                    fallback: (context) => ConditionalBuilder(
                      condition: state is GetAdminsAccountsFailere,
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
                        itemCount: cubit.accountModel!.data.length,
                        itemBuilder: (context, index) => CustomAdimnAccountItem(
                          adminData: cubit.accountModel!.data[index],
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
