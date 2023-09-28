// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:adminapp/core/class/api/api_service.dart';
import 'package:adminapp/core/class/api/failures.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/features/categories/data/models/category_model.dart';
import 'package:adminapp/features/categories/data/repos/categories_repo.dart';
import 'package:dartz/dartz.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  ApiService apiService;
  CategoriesRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, CategoryModel>> getCategoriesData() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getCategories,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(CategoryModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> addCat(
      String nameEN, String nameAR, File file) async {
    try {
      var response = await apiService.postwithSingleImage(
          ApiLinks.addCategories,
          {
            'nameEN': nameEN,
            'nameAr': nameAR,
          },
          file,
          namerequest: 'file');
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
  Future<Either<Failure, Map>> editCat(String nameEN, String nameAR,String catID, String oldImage,
      {File? file}) async {
    try {
    Either<Failure, Map> response;
      if (file == null) {
        response = await apiService.postData(
          ApiLinks.editCategories,
          {
            'nameEN': nameEN,
            'nameAR': nameAR,
            'id':catID,
            'oldimage':oldImage
          },
        );
      } else {
        response = await apiService.postwithSingleImage(
          ApiLinks.editCategories,
          {
            'nameEN': nameEN,
            'nameAR': nameAR,
             'id':catID,
            'oldimage':oldImage,
          },
          file,
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
  Future<Either<Failure, Map>> daleteCat(String catID,String oldImage) async{
     try {
      var response = await apiService.postData(
          ApiLinks.deleteCategories,
          {
            'id': catID,
            'imageName':oldImage
          },
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
}
