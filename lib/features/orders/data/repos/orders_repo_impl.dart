// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adminapp/core/class/api/api_service.dart';
import 'package:adminapp/core/class/api/failures.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/features/orders/data/models/cities_model/cities_model.dart';
import 'package:adminapp/features/orders/data/models/delivery_id_model.dart';
import 'package:adminapp/features/orders/data/models/order_details_model/order_details_model.dart';
import 'package:adminapp/features/orders/data/models/order_model.dart';
import 'package:adminapp/features/orders/data/repos/orders_repo.dart';
import 'package:dartz/dartz.dart';

class OrdersRepoImpl implements OrdersRepo {
  ApiService apiService;
  OrdersRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, OrderModel>> getOrdersDelivery() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getOrdersDelivery,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(OrderModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, OrderModel>> getOrdersPending() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getOrdersPending,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(OrderModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, OrderModel>> getOrdersPrepared() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getOrdersPrepared,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(OrderModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, OrderModel>> getOrdersReceived() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getOrdersReceived,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(OrderModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> approveOrder(
    String userID,
    String orderID,
    String deliveryID,
  ) async {
    try {
      var response = await apiService.postData(ApiLinks.approveOrder, {
        'userid': userID,
        'orderid': orderID,
        'deliveryid': deliveryID,
      });
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(data);
      });
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> cancelOrder(
      String userID, String orderID) async {
    try {
      var response = await apiService.postData(
          ApiLinks.cancelOrder, {'userid': userID, 'orderid': orderID});
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(data);
      });
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> preparedOrder(
      String userID, String orderID) async {
    try {
      var response = await apiService.postData(
          ApiLinks.preparedOrder, {'userid': userID, 'orderid': orderID});
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(data);
      });
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, DeliveryIdModel>> getDeliveryID() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getDeliveryID,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(DeliveryIdModel.fromJson(data));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(String orderID) async{
   try {
      var response = await apiService.postData(ApiLinks.getOrderDetails, {
        'orderId': orderID,
      });
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(OrderDetailsModel.fromJson(data));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }

    @override
  Future<Either<Failure, CitiesModel>> getCities() async {
    try {
      var response = await apiService.postData(ApiLinks.getCities, {});
      return response.fold(
        (failere) => left(failere),
        (data) => right(
          CitiesModel.fromJson(data),
        ),
      );
    } on ServerFailere catch (e) {
      return left(ServerFailere.checkonErrormessage(e.errMessage));
    }
  }
}
