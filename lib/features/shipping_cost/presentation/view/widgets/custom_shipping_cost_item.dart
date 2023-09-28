import 'package:flutter/material.dart';

import '../../../../../core/constants/colors_manager.dart';

// ignore: must_be_immutable
class CustomShippingCostItem extends StatelessWidget {
  CustomShippingCostItem({
    super.key,
    required this.cityNameAr,
    required this.cityNameEn,
    required this.cost,
    required this.delete
  });

  String cityNameEn;
  String cityNameAr;
  String cost;
 Function()? delete;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorsManager.grey,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('City Name EN: ',
                          style: Theme.of(context).textTheme.titleSmall),
                      Text(
                        cityNameEn,
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('City Name AR: ',
                          style: Theme.of(context).textTheme.titleSmall),
                      Text(cityNameAr,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Shipping Cost: ',
                          style: Theme.of(context).textTheme.titleSmall),
                      Text('$cost\$',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: delete,
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorsManager.red,
                              borderRadius: BorderRadius.circular(
                                30,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 1),
                            child: Text(
                              'Delete',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: ColorsManager.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
