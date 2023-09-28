
import '../../../../../core/constants/colors_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCityItem extends StatelessWidget {
   CustomCityItem({
    super.key,
    required this.cityAR,
    required this.cityEN,
    required this.delete,
    required this.edit,
  });

String cityEN;
String cityAR;
Function()? delete;
  Function()? edit;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManager.grey,
          borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
                const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    cityEN,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorsManager.black),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: edit,
                    child: const Icon(
                      Icons.edit,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: delete,
                    child: const Icon(
                      Icons.delete,
                      color: ColorsManager.red,
                    ),
                  ),
                const  Spacer(),
                  Text(
                    cityAR,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                            height: 1.2,
                            color: ColorsManager.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
