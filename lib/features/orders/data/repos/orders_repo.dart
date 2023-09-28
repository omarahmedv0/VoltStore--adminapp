import '../../../../core/class/api/failures.dart';
import '../models/cities_model/cities_model.dart';
import '../models/delivery_id_model.dart';
import '../models/order_details_model/order_details_model.dart';
import '../models/order_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrdersRepo {
  Future<Either<Failure,OrderModel>> getOrdersPending();
  Future<Either<Failure,OrderModel>> getOrdersPrepared();
  Future<Either<Failure,OrderModel>> getOrdersDelivery();
  Future<Either<Failure,OrderModel>> getOrdersReceived();
  Future<Either<Failure,Map>> approveOrder(String userID, String orderID,String deliveryID);
  Future<Either<Failure,Map>> preparedOrder(String userID, String orderID);
  Future<Either<Failure,Map>> cancelOrder(String userID, String orderID);
  Future<Either<Failure,DeliveryIdModel>> getDeliveryID();
  Future<Either<Failure,OrderDetailsModel>> getOrderDetails(String orderID);
  Future<Either<Failure, CitiesModel>> getCities();

}