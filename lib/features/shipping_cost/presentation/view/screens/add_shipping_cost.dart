import '../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_botton.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../widgets/custom_drop_botton_shipping_cost.dart';
import '../../view_model/add_shipping_cost_cubit/add_shipping_cost_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AddShippingCostScreen extends StatelessWidget {
  const AddShippingCostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddShippingCostCubit, AddShippingCostState>(
      builder: (context, state) {
        AddShippingCostCubit cubit = AddShippingCostCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: SafeArea(
              child: Scaffold(
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomAppBar(
                  title: 'Add Shipping Cost',
                  ispadding: true,
                  isleading: true,
                  onTap: () {
                    pop(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                ConditionalBuilder(
                  condition: state is GetCitiesLoading,
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
                  fallback: (context) =>Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: cubit.costController,
                            labelText: 'Shipping Cost',
                            hint: 'Enter value',
                            keyboardType: TextInputType.number,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.h),
                          const CustomDropBottonShippingCity(),
                          SizedBox(height: 25.h),
                          CustomBotton(
                            text: 'Add ShippingCost',
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                if (cubit.citySelected== null) {
                                  customSnackBar(
                                    context,
                                    'Please Select City',
                                    AnimatedSnackBarType.success,
                                    300,
                                  );
                                } else {
                                  cubit.addShippingCost(context);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
