import '../../../../../core/constants/colors_manager.dart';
import '../../view_model/add_shipping_cost_cubit/add_shipping_cost_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropBottonShippingCity extends StatelessWidget {
  const CustomDropBottonShippingCity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddShippingCostCubit, AddShippingCostState>(
      builder: (context, state) {
        AddShippingCostCubit cubit = AddShippingCostCubit.get(context);
        return Container(
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
            color: ColorsManager.grey.withOpacity(.2),
            borderRadius: BorderRadius.circular(180),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
               cubit.citiesModel!.data.isEmpty?'All governorates added': 'Select City',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: cubit.citiesModel!.data
                  .map((item) => DropdownMenuItem<String>(
                        value: item.cityNameEn,
                        child: Text(
                          item.cityNameEn!,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: ColorsManager.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ))
                  .toList(),
              value: cubit.citySelected,
              onChanged: (value) {
                cubit.onCityChanged(value);
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
