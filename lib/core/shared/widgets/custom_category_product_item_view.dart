import '../../constants/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomCategoryandProductItem extends StatelessWidget {
   CustomCategoryandProductItem({
    super.key,
    required this.date,
    required this.deleteFun,
    required this.editFun,
    required this.image,
    required this.titleAR,
    required this.titleEN
  });

  String image;
  String titleEN;
  String titleAR;

  String date;
  Function()? deleteFun;
  Function()? editFun;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Image.network(
            image,
            width: 75.w,
            height: 75.h,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                titleEN,
                style: Theme.of(context).textTheme.titleSmall,
              ),
             Text(
                titleAR,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.2),
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Column(
          children: [
            InkWell(
              onTap: deleteFun,
              child: const Icon(
                Icons.delete_forever,
                color: ColorsManager.red,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: editFun,
              child: const Icon(
                Icons.edit,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
