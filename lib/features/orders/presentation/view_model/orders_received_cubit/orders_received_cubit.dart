import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/order_model.dart';
import '../../../data/repos/orders_repo_impl.dart';

part 'orders_received_state.dart';

class OrdersReceivedCubit extends Cubit<OrdersReceivedState> {
  OrdersReceivedCubit(this.ordersRepoImpl) : super(OrdersReceivedInitial());
  static OrdersReceivedCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  OrdersRepoImpl ordersRepoImpl;
  OrderModel? orderModel;
  Future<void> getOrdersReceivedData() async {
    emit(GetOrdersReceivedLoading());
    var response = await ordersRepoImpl.getOrdersReceived();
    response.fold((failure) {
      emit(GetOrdersReceivedFailere());
    }, (data) {
      orderModel = data;
      emit(GetOrdersReceivedSuccess());
    });
  }
}
