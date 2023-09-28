import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../data/models/order_model.dart';
import '../../../data/repos/orders_repo_impl.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'orders_prepared_state.dart';

class OrdersPreparedCubit extends Cubit<OrdersPreparedState> {
  OrdersPreparedCubit(this.ordersRepoImpl) : super(OrdersPreparedInitial());
  static OrdersPreparedCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  OrdersRepoImpl ordersRepoImpl;
  OrderModel? orderModel;
  Future<void> getOrdersPreparedData() async {
    emit(GetOrdersPreparedLoading());
    var response = await ordersRepoImpl.getOrdersPrepared();
    response.fold((failure) {
      emit(GetOrdersPreparedFailere());
    }, (data) {
      orderModel = data;
      emit(GetOrdersPreparedSuccess());
    });
  }

  Future<void> preparedOrder(
      String orderID, String userID, BuildContext context) async {
    emit(PreparedOrderLoading());
    var response = await ordersRepoImpl.preparedOrder(
      userID,
      orderID,
    );
    response.fold((failure) {
      emit(PreparedOrderFailere());
    }, (data) {
      customSnackBar(
        context,
        'Prepared',
        AnimatedSnackBarType.success,
        300,
      );
      getOrdersPreparedData();
      emit(PreparedOrderSuccess());
    });
  }
}
