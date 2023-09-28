import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../models/category_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, CategoryModel>> getCategoriesData();
  Future<Either<Failure, Map>> addCat(String nameEN, String nameAR, File file);
  Future<Either<Failure, Map>> editCat(
      String nameEN, String nameAR, String catID, String oldImage,
      {File? file});
  Future<Either<Failure, Map>> daleteCat(
    String catID,
    String oldImage
  );
}
