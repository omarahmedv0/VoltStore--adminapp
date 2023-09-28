// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adminapp/core/class/api/api_service.dart';
import 'package:adminapp/core/class/api/failures.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/features/orders/data/models/cities_model/cities_model.dart';
import 'package:adminapp/features/shipping_cost/data/models/shipping_cost_model.dart';
import 'package:adminapp/features/shipping_cost/data/repos/shipping_cost_repo.dart';
import 'package:dartz/dartz.dart';

class ShippingCostRepoImpl implements ShippingCostRepo {
  ApiService apiService;
  ShippingCostRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, ShippingCostModel>> getShippingCostsData() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getShippingCostData,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(ShippingCostModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> addShippingCost(
      String cityID, String cost) async {
    try {
      var response = await apiService.postData(
        ApiLinks.addShippingCost,
        {
          'cityid': cityID,
          'cost': cost,
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
  Future<Either<Failure, Map>> deleteShippingCost(String id) async {
    try {
      var response = await apiService.postData(
        ApiLinks.deleteShippingCost,
        {
          'id': id,
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
  Future<Either<Failure, CitiesModel>> getSCitiesData() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getCitiesData,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(CitiesModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
