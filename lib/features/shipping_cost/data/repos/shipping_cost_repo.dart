import '../../../../core/class/api/failures.dart';
import '../../../orders/data/models/cities_model/cities_model.dart';
import '../models/shipping_cost_model.dart';
import 'package:dartz/dartz.dart';

abstract class ShippingCostRepo {
  Future<Either<Failure, ShippingCostModel>> getShippingCostsData();
  Future<Either<Failure, CitiesModel>> getSCitiesData();
  Future<Either<Failure, Map>> addShippingCost(
    String cityID,
    String cost,
  );

  Future<Either<Failure, Map>> deleteShippingCost(
    String id,
  );
}
