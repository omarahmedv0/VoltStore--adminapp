
import 'package:adminapp/features/orders/presentation/view_model/orders_pending_cubit/orders_pending_state.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../data/models/delivery_id_model.dart';
import '../../../data/models/order_model.dart';
import '../../../data/repos/orders_repo_impl.dart';


class OrdersPendingCubit extends Cubit<OrdersPendingState> {
  OrdersPendingCubit(this.ordersRepoImpl) : super(OrdersPendingInitial());

  static OrdersPendingCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  OrdersRepoImpl ordersRepoImpl;
  OrderModel? orderModel;
  List<String> deliveryIdData = [];
  setDeliveryIdList() {
    for (int i = 0; i < deliveryIdModel!.data!.length; i++) {
      deliveryIdData.add(deliveryIdModel!.data![i].deliveryId!);
    }
  }

  String? deleviryIDSelected;
  onDeliveryIDChanged(String? val) {
    deleviryIDSelected = val;
    emit(Update());
  }

  Future<void> getOrdersPendingData() async {
    emit(GetOrdersPendingLoading());
    var response = await ordersRepoImpl.getOrdersPending();
    response.fold((failure) {
      emit(GetOrdersPendingFailere());
    }, (data) {
      orderModel = data;
      emit(GetOrdersPendingSuccess());
    });
  }

  DeliveryIdModel? deliveryIdModel;
  Future<void> getDeliveryID() async {
    emit(GetDeliveryIDLoading());
    var response = await ordersRepoImpl.getDeliveryID();
    response.fold((failure) {
      emit(GetDeliveryIDFailere());
    }, (data) {
      deliveryIdModel = data;
      emit(GetDeliveryIDSuccess());
    });
  }

  Future<void> approveOrder(
      String orderID, String userID, BuildContext context) async {
    emit(ApproveOrderLoading());
    var response = await ordersRepoImpl.approveOrder(
      userID,
      orderID,
      deleviryIDSelected!,
    );
    response.fold((failure) {
      emit(ApproveOrderFailere());
    }, (data) {
      customSnackBar(
        context,
        'Approved',
        AnimatedSnackBarType.success,
        300,
      );
      getOrdersPendingData();
      emit(ApproveOrderSuccess());
    });
  }

  Future<void> cancelOrder(
      String orderID, String userID, BuildContext context) async {
    emit(CancelOrderLoading());
    var response = await ordersRepoImpl.cancelOrder(
      userID,
      orderID,
    );
    response.fold((failure) {
      emit(CancelOrderFailere());
    }, (data) {
      customSnackBar(
        context,
        'Cancelled',
        AnimatedSnackBarType.success,
        300,
      );
      getOrdersPendingData();
      emit(CancelOrderSuccess());
    });
  }
}
