import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/order_model.dart';
import '../../../data/repos/orders_repo_impl.dart';

part 'orders_indelivery_state.dart';

class OrdersIndeliveryCubit extends Cubit<OrdersIndeliveryState> {
  OrdersIndeliveryCubit(this.ordersRepoImpl) : super(OrdersIndeliveryInitial());
  static OrdersIndeliveryCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  OrdersRepoImpl ordersRepoImpl;
  OrderModel? orderModel;
  Future<void> getOrdersDeliveryData() async {
    emit(GetOrdersDeliveryLoading());
    var response = await ordersRepoImpl.getOrdersDelivery();
    response.fold((failure) {
      emit(GetOrdersDeliveryFailere());
    }, (data) {
      orderModel = data;
      emit(GetOrdersDeliverySuccess());
    });
  }
}
