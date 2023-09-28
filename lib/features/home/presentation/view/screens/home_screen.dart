import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/assets/image_assets_manager.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../widgets/custom_botton_control_board.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorsManager.primary,
                  borderRadius: BorderRadius.circular(30)),
              child: CustomAppBar(
                titleColor: ColorsManager.white,
                title: 'Control Board',
                ispadding: false,
                isleading: false,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 130.h,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                CustomBottonControlBoard(
                  image: ImageAssetsManager.categories,
                  title: 'Categories',
                  onTap: () {
                    toNamed(context, RouteManager.categories);
                  },
                ),
                CustomBottonControlBoard(
                  image: ImageAssetsManager.products,
                  title: 'Products',
                  onTap: () {
                    toNamed(context, RouteManager.products);
                  },
                ),
                CustomBottonControlBoard(
                  image: ImageAssetsManager.users,
                  title: 'Accounts',
                  onTap: () {
                    toNamed(
                      context,
                      RouteManager.accounts,
                    );
                  },
                ),
                CustomBottonControlBoard(
                  image: ImageAssetsManager.orders,
                  title: 'Orders',
                  onTap: () {
                    toNamed(
                      context,
                      RouteManager.orders,
                    );
                  },
                ),
                CustomBottonControlBoard(
                  image: ImageAssetsManager.cities,
                  title: 'Cities',
                  onTap: () {
                    toNamed(
                      context,
                      RouteManager.cities,
                    );
                  },
                ),
                CustomBottonControlBoard(
                  image: ImageAssetsManager.shipping,
                  title: 'Shipping Cost',
                  onTap: () {
                    toNamed(
                      context,
                      RouteManager.shippingCost,
                    );
                  },
                ),
                CustomBottonControlBoard(
                  image: ImageAssetsManager.coupons,
                  title: 'Coupons',
                  onTap: () {
                    toNamed(
                      context,
                      RouteManager.coupons,
                    );
                  },
                ),
              
              ],
            )
          ],
        ),
      ),
    ));
  }
}
