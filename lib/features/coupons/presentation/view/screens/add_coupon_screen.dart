import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_botton.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../widgets/custom_botton_date_picker_coupon.dart';
import '../../view_model/add_coupons_cubit/add_coupons_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCouponScreen extends StatelessWidget {
  const AddCouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCouponsCubit, AddCouponsState>(
      builder: (context, state) {
        AddCouponsCubit cubit = AddCouponsCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: SafeArea(
              child: Scaffold(
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomAppBar(
                  title: 'Add Coupon',
                  ispadding: true,
                  isleading: true,
                  onTap: () {
                    pop(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        controller: cubit.nameController,
                        labelText: 'Coupon Name',
                        hint: 'Enter Coupon Name',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'The field is Empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: cubit.discountController,
                        labelText: 'Coupon Discount',
                        hint: 'Enter Coupon Discount',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'The field is Empty';
                          }else if(int.parse(val) > 100)
                          {
                            return 'The value cannot be greater than 100%';
                          }else if(int.parse(val) < 1)
                          {
                            return 'The value cannot be less than 1%';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: cubit.countController,
                        labelText: 'Coupon Count',
                        hint: 'Enter Coupon Count',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'The field is Empty';
                          }else if(int.parse(val) < 1)
                          {
                            return 'The value cannot be less than 1';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Expire Date:',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const CustomBottonDatePickerAddCoupon(),
                      SizedBox(height: 20.h,),
                      CustomBotton(
                        radius: 30,
                        text: 'Add Coupon',
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            if (cubit.expireDate == null) {
                              customSnackBar(
                                context,
                                'You must choose an expireDate',
                                AnimatedSnackBarType.info,
                                300,
                              );
                            } else {
                              cubit.addCoupon(context);
                            }
                          }
                        },
                      ),
                    ],
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
