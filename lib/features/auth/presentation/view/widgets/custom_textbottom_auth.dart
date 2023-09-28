// ignore_for_file: must_be_immutable

import 'package:adminapp/core/constants/colors_manager.dart';
import 'package:flutter/material.dart';


class CustomTextBottomAuth extends StatelessWidget {
   CustomTextBottomAuth({super.key,required this.fun,required this.text});
  String text;
  void Function()? fun;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorsManager.primary,
            ),
            child: MaterialButton(
              onPressed:fun,
              child:  Text(
                text,
                style:const TextStyle(
                    color: ColorsManager.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          );
  }
}