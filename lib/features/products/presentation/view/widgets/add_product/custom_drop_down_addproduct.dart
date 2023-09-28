// ignore_for_file: must_be_immutable

import '../../../view_model/add_product_cubit/add_product_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/colors_manager.dart';

class CustomDropBottonAddProduct extends StatelessWidget {
  CustomDropBottonAddProduct(
      {super.key,
      required this.text,
      required this.list,
      required this.onChanged,
      required this.valueSelected});
  String text;
  List list;
  String? valueSelected;
  Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorsManager.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(180)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: list
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
              value: valueSelected,
              onChanged: onChanged,
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
