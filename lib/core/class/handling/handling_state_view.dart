// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import '../../constants/assets/lottie_assets_manager.dart';

class HandlingStateView extends StatelessWidget {
  HandlingStateView({
    super.key,
    required this.child,
    required this.conditionEmpty,
    required this.conditionError,
    required this.conditionLoading,
  });
  bool conditionEmpty;
  bool conditionLoading;
  bool conditionError;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: conditionLoading,
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
        condition: conditionEmpty,
        builder: (context) => Center(
            child: Lottie.asset(LottieAssetsManager.empty,
                width: 250, height: 450)),
        fallback: (context) => ConditionalBuilder(
          condition: conditionError,
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
          fallback: (context) => child,
        ),
      ),
    );
  }
}
