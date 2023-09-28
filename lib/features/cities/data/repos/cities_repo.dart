import '../../../../core/class/api/failures.dart';
import '../../../orders/data/models/cities_model/cities_model.dart';
import 'package:dartz/dartz.dart';

abstract class CitiesRepo {
  Future<Either<Failure, CitiesModel>> getCities();
  Future<Either<Failure, Map>> addCity(
    String nameEN,
    String nameAR,
  );
   Future<Either<Failure, Map>> editCity(
    String cityID,
    String nameEN,
    String nameAR,
  );
   Future<Either<Failure, Map>> deleteCity(
    String cityID,
   
  );
}
