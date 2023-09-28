import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/functions/check_product_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: must_be_immutable
class CustomSizePartProductDetails extends StatelessWidget {
  CustomSizePartProductDetails({
    super.key,
    required this.size,
  });

  List<String> size;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ...List.generate(
                  size.length,
                  (index) => Container(
                    margin: EdgeInsets.only(
                      right: 5.w,
                    ),
                    decoration: BoxDecoration(
                      color:
                         ColorsManager.black,
                      borderRadius: BorderRadius.circular(
                        180,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        .7,
                      ),
                      child: CircleAvatar(
                        backgroundColor:ColorsManager.black,
                        child: Text(
                          checkProductSize(size[index]),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                color:  ColorsManager.white
                                    ,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
}}
