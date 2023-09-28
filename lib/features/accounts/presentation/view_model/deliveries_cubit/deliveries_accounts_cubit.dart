import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../data/models/delivey_account_model.dart';
import '../../../data/repos/accounts_repo_impl.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deliveries_accounts_state.dart';

class DeliveriesAccountsCubit extends Cubit<DeliveriesAccountsState> {
  DeliveriesAccountsCubit(this.accountsRepoImpl) : super(DeliveriesAccountsInitial());
AccountsRepoImpl accountsRepoImpl;
   static DeliveriesAccountsCubit get(BuildContext context)
  {
    return BlocProvider.of(context);
  }

DeliveryAccountModel? deliveryAccountModel;
  Future<void> getDeliveriesAccounts() async {
    emit(GetDeliveriesAccountsLoading());
    var response = await accountsRepoImpl.getDeliveriesAccounts();
    response.fold((failure) {
      emit(GetDeliveriesAccountsFailere());
    }, (data) {
      deliveryAccountModel = data;
      emit(GetDeliveriesAccountsSuccess());
    });
  }

    deleteAdminAccount(BuildContext context, String id) async {
    emit(DeleteDeliveryAccountLoading());
    var response = await accountsRepoImpl.deleteDeliveryAccount(
      id,
    );
    response.fold((failure) {
      emit(DeleteDeliveryAccountFailere());
    }, (data) {
      getDeliveriesAccounts().then((value) {
        customSnackBar(
          context,
          'Deleted Successfully',
          AnimatedSnackBarType.success,
          300,
        );
      });
      emit(DeleteDeliveryAccountSuccess());
    });
  }
}
