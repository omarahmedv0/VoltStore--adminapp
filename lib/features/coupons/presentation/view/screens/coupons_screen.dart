import '../../../../../core/class/handling/handling_state_view.dart';
import '../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../widgets/custom_coupon_item.dart';
import '../../view_model/coupons_cubit/coupons_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponsCubit, CouponsState>(
      builder: (context, state) {
        CouponsCubit cubit = CouponsCubit.get(context);
        return SafeArea(
            child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              toNamed(
                context,
                RouteManager.addCoupon,
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
                title: 'Coupons',
                ispadding: true,
                isleading: true,
                onTap: () {
                  pop(context);
                },
              ),
              ConditionalBuilder(
                condition: state is GetCouponLoading,
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
                  conditionEmpty: cubit.couponModel!.data!.isEmpty,
                  conditionError: state is GetCouponFailere,
                  conditionLoading: state is GetCouponLoading,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => CustomCouponItem(
                      couponData: cubit.couponModel!.data![index],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15.h,
                    ),
                    itemCount: cubit.couponModel!.data!.length,
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
