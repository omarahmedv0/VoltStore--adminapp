import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors_manager.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
     this.onTap,
    required this.title,
   required this.ispadding,
   required this.isleading ,
   this.titleColor
  });
  bool? ispadding ;
    bool? isleading ;
Color? titleColor;
  void Function()? onTap;
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ispadding == true
          ? EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h)
          : EdgeInsets.zero,
      child:isleading == true? Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_back_ios,
                color: ColorsManager.primary,
              ),
            ),
          ),
          const Spacer(),
          Text(title, style: Theme.of(context).textTheme.titleMedium!),
          const Spacer(flex: 2)
        ],
      ): Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: titleColor ?? ColorsManager.black,
          )),
        ],
      ),
    );
  }
}
