
import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/functions/navigation/pop.dart';
import 'package:flutter/material.dart';


class CustomLeadingIconProductDetails extends StatelessWidget {
  const CustomLeadingIconProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      height: 10,
      minWidth: 10,
      onPressed: () {
        pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios,
        size: 23,
        color: ColorsManager.primary,
      ),
    );
  }
}
