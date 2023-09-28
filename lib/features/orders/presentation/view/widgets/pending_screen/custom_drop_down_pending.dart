
import 'package:adminapp/features/orders/presentation/view_model/orders_pending_cubit/orders_pending_state.dart';

import '../../../view_model/orders_pending_cubit/orders_pending_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/colors_manager.dart';

class CustomDropBottonPending extends StatelessWidget {
  const CustomDropBottonPending({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersPendingCubit, OrdersPendingState>(
      builder: (context, state) {
        var cubit = OrdersPendingCubit.get(context);
        return Container(
          width: double.infinity,
          height: 30.h,
          decoration: BoxDecoration(
            color: ColorsManager.grey.withOpacity(.2),
            borderRadius: BorderRadius.circular(180),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select Deivery man ID',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: cubit.deliveryIdData
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: ColorsManager.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ))
                  .toList(),
              value: cubit.deleviryIDSelected,
              onChanged: (value) {
                cubit.onDeliveryIDChanged(value);
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        );
      },
    );
  }
}
