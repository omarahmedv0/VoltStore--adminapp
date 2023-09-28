
import 'package:flutter/material.dart';

import '../../constants/colors_manager.dart';

// ignore: must_be_immutable
class CustomCardNavigation extends StatelessWidget {
   CustomCardNavigation({
    super.key,
    required this.onTap,
    required this.text
  });
 Function()? onTap;
 String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Card(
        margin: const EdgeInsets.all(2),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                text,
              style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
              color: ColorsManager.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
