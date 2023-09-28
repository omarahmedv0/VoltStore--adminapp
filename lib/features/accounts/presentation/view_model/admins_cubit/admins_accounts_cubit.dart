import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../data/models/admin_account_model.dart';
import '../../../data/repos/accounts_repo_impl.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'admins_accounts_state.dart';

class AdminsAccountsCubit extends Cubit<AdminsAccountsState> {
  AdminsAccountsCubit(this.accountsRepoImpl) : super(AdminsAccountsInitial());
  AccountsRepoImpl accountsRepoImpl;
  static AdminsAccountsCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  AdminAccountModel? accountModel;
  Future<void> getAdminsAccounts() async {
    emit(GetAdminsAccountsLoading());
    var response = await accountsRepoImpl.getAdminsAccounts();
    response.fold((failure) {
      emit(GetAdminsAccountsFailere());
    }, (data) {
      accountModel = data;
      emit(GetAdminsAccountsSuccess());
    });
  }

  deleteAdminAccount(BuildContext context, String id) async {
    emit(DeleteAdminAccountLoading());
    var response = await accountsRepoImpl.deleteAdminAccount(
      id,
    );
    response.fold((failure) {
      emit(DeleteAdminAccountFailere());
    }, (data) {
      getAdminsAccounts().then((value) {
        customSnackBar(
          context,
          'Deleted Successfully',
          AnimatedSnackBarType.success,
          300,
        );
      });
      emit(DeleteAdminAccountSuccess());
    });
  }
}
