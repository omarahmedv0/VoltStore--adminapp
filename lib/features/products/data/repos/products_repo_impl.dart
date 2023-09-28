// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/features/products/data/models/color_model/product_colors_model.dart';
import 'package:adminapp/features/products/data/models/size_model/product_size_model.dart';
import 'package:dartz/dartz.dart';

import 'package:adminapp/core/class/api/api_service.dart';
import 'package:adminapp/core/class/api/failures.dart';
import 'package:adminapp/features/products/data/models/products_model.dart';
import 'package:adminapp/features/products/data/repos/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  ApiService apiService;
  ProductsRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, ProductsModel>> getProductsData() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getProducts,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(ProductsModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, ProductColorsModel>> getProductColor(
      String productID) async {
    try {
      var response = await apiService
          .postData(ApiLinks.getProductColor, {'productid': productID});
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(ProductColorsModel.fromJson(data));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, ProductSizeModel>> getProductSize(
      String productID) async {
    try {
      var response = await apiService
          .postData(ApiLinks.getProductSize, {'productid': productID});
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(ProductSizeModel.fromJson(data));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
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
    File image,
  ) async {
    try {
      var response = await apiService.postwithSingleImage(
        ApiLinks.addProducts,
        {
          'nameAR': nameAR,
          'nameEN': nameEN,
          'descAR': descAR,
          'descEN': descEN,
          'count': count,
          'price': price,
          'discount': discount,
          'color1': color1,
          'color2': color2,
          'color3': color3,
          'size1': size1,
          'size2': size2,
          'size3': size3,
          'cat1': cat1,
          'cat2': cat2,
        },
        image,
        namerequest: 'file',
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          data,
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
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
      {File? image}) async {
    try {
      Either<Failure, Map> response;
      if (image == null) {
        response = await apiService.postData(
          ApiLinks.editProducts,
          {
            'id': id,
            'nameAR': nameAR,
            'nameEN': nameEN,
            'descAR': descAR,
            'descEN': descEN,
            'count': count,
            'price': price,
            'discount': discount,
            'color1': color1,
            'color2': color2,
            'color3': color3,
            'size1': size1,
            'size2': size2,
            'size3': size3,
            'oldimage': oldImage,
          },
        );
      } else {
        response = await apiService.postwithSingleImage(
          ApiLinks.editProducts,
          {
            'id': id,
            'nameAR': nameAR,
            'nameEN': nameEN,
            'descAR': descAR,
            'descEN': descEN,
            'count': count,
            'price': price,
            'discount': discount,
            'color1': color1,
            'color2': color2,
            'color3': color3,
            'size1': size1,
            'size2': size2,
            'size3': size3,
            'oldimage': oldImage,
          },
          image,
          namerequest: 'file',
        );
      }
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          data,
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
  
  @override
  Future<Either<Failure, Map>> deleteProduct(String id, String oldImage) async{
     try {
      var response = await apiService
          .postData(ApiLinks.deleteProducts, {'id': id,'imageName':oldImage});
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(data);
      });
    } on Failure catch (e) {
      return left(e);
    }
  }
}
