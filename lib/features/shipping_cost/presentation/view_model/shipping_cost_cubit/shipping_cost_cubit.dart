import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../data/models/shipping_cost_model.dart';
import '../../../data/repos/shipping_cost_repo_impl.dart';

part 'shipping_cost_state.dart';

class ShippingCostCubit extends Cubit<ShippingCostState> {
  ShippingCostCubit(this.shippingCostRepoImpl) : super(ShippingCostInitial());
  ShippingCostRepoImpl shippingCostRepoImpl;

  static ShippingCostCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  ShippingCostModel? shippingCostModel;

  Future<void> getShippingCostData() async {
    emit(GetShippingCostLoading());
    var response = await shippingCostRepoImpl.getShippingCostsData();
    response.fold((failure) {
      emit(GetShippingCostFailere());
    }, (data) {
      shippingCostModel = data;
      emit(GetShippingCostSuccss());
    });
  }

  deleteShippingCost(BuildContext context, String costID) async {
    emit(DeleteShippingCostLoading());
    var response = await shippingCostRepoImpl.deleteShippingCost(
      costID,
    );
    response.fold((failure) {
      emit(DeleteShippingCostFailere());
    }, (data) {
      customSnackBar(
        context,
        'Deleted Successfully',
        AnimatedSnackBarType.success,
        300,
      );
      getShippingCostData();
      emit(DeleteShippingCostSuccss());
    });
  }
}
