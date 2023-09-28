import '../../../../../core/constants/colors_manager.dart';
import '../../view_model/add_coupons_cubit/add_coupons_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottonDatePickerAddCoupon extends StatelessWidget {
  const CustomBottonDatePickerAddCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCouponsCubit, AddCouponsState>(
      builder: (context, state) {
        AddCouponsCubit cubit = AddCouponsCubit.get(context);
        return Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: cubit.expireDate != null
                ? ColorsManager.primary
                : ColorsManager.grey,
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          child: MaterialButton(
            height: 5,
            padding: EdgeInsets.zero,
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
              ).then((value) {
                cubit.onChangeExpireDate(value);
              });
            },
            child: Text(
              cubit.expireDate != null ? 'Date Selected' : 'Select Expire Date',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.white,
                  ),
            ),
          ),
        );
      },
    );
  }
}
