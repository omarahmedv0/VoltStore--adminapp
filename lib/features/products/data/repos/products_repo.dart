import 'dart:io';

import '../../../../core/class/api/failures.dart';
import '../models/color_model/product_colors_model.dart';
import '../models/products_model.dart';
import '../models/size_model/product_size_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepo {
  Future<Either<Failure, ProductsModel>> getProductsData();
  Future<Either<Failure, ProductColorsModel>> getProductColor(String productID);
  Future<Either<Failure, ProductSizeModel>> getProductSize(String productID);
  Future<Either<Failure, Map>> addProduct(
      String nameEN,
      String nameAR,
      String descEN,
      String descAR,
      String price,
      String discount,
      String count,
      String cat1,
      String cat2,
      String color1,
      String color2,
      String color3,
      String size1,
      String size2,
      String size3,
      File image);
  Future<Either<Failure, Map>> editProduct(
    String id,
    String oldImage,
    String nameEN,
    String nameAR,
    String descEN,
    String descAR,
    String price,
    String discount,
    String count,
    String color1,
    String color2,
    String color3,
    String size1,
    String size2,
    String size3,
   { File image,}
  );
   Future<Either<Failure, Map>> deleteProduct(
    String id,
    String oldImage
   );
}
