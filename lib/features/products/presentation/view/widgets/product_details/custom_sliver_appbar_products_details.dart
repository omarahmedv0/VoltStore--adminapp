import '../../../../../../core/constants/api_links.dart';
import '../../../../../../core/constants/colors_manager.dart';
import '../../../../data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'custom_leading_icon_product_details.dart';

// ignore: must_be_immutable
class CustomSliverAppbarProductDetails extends StatelessWidget {
  CustomSliverAppbarProductDetails({
    super.key,
    required this.productDetails,
  });
  ProductData productDetails;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      stretch: true,
      automaticallyImplyLeading: false,
      leading: const CustomLeadingIconProductDetails(),
      backgroundColor: ColorsManager.background,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: productDetails.productId!,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                '${ApiLinks.productsImagesLink}/${productDetails.productImage}',
              ),
            
             
            ],
          ),
        ),
      ),
    );
  }
}
