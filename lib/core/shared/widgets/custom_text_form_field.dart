import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors_manager.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.validator,
      this.onSaved,
      this.hint,
      this.keyboardType,
      this.onTapIcon,
      this.suffIcon,
      this.obscureText});
  Function(String?)? onSaved;
  String? Function(String?)? validator;
  TextEditingController controller;
  String labelText;
  String? hint;
  Function()? onTapIcon;
  Icon? suffIcon;
  final bool? obscureText;

  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      textDirection:  TextDirection.ltr,
      onChanged: onSaved,
      validator: validator,
      controller: controller,
      cursorColor: ColorsManager.primary,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: ColorsManager.black.withOpacity(.8),
            fontSize: 15.sp,
            height: 1,
          ),
      decoration: InputDecoration(
        suffixIcon: onTapIcon == null
            ? null
            : InkWell(onTap: onTapIcon, child: suffIcon),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: ColorsManager.primary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            180,
          ),
          borderSide: const BorderSide(
            color: ColorsManager.red,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            180,
          ),
          borderSide: const BorderSide(
            color: ColorsManager.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            180,
          ),
          borderSide: const BorderSide(
            color: ColorsManager.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            180,
          ),
          borderSide: const BorderSide(
            color: ColorsManager.grey,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 12.sp,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 20,
        ),
      ),
    );
  }
}
