// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adminapp/core/class/api/api_service.dart';
import 'package:adminapp/core/class/api/failures.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/features/cities/data/repos/cities_repo.dart';
import 'package:adminapp/features/orders/data/models/cities_model/cities_model.dart';
import 'package:dartz/dartz.dart';

class CitiesRepoImpl implements CitiesRepo {
  ApiService apiService;
  CitiesRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, CitiesModel>> getCities() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getCities,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          CitiesModel.fromJson(data),
        );
      });
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> addCity(String nameEN, String nameAR) async {
    try {
      var response = await apiService.postData(
        ApiLinks.addCity,
        {'cityen': nameEN, 'cityar': nameAR},
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
  Future<Either<Failure, Map>> deleteCity(String cityID) async {
    try {
      var response = await apiService.postData(
        ApiLinks.deleteCity,
        {
          'id': cityID,
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

  @override
  Future<Either<Failure, Map>> editCity(
    String cityID,
    String nameEN,
    String nameAR,
  ) async {
    try {
      var response = await apiService.postData(
        ApiLinks.editCity,
        {
          'cityen': nameEN,
          'id': cityID,
          'cityar': nameAR,
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
