import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../data/repos/accounts_repo_impl.dart';
import '../admins_cubit/admins_accounts_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_admin_account_state.dart';

class AddAdminAccountCubit extends Cubit<AddAdminAccountState> {
  AddAdminAccountCubit(this.accountsRepoImpl) : super(AddAdminAccountInitial());
  static AddAdminAccountCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  AccountsRepoImpl accountsRepoImpl;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  addAdminAccount(BuildContext context) async {
    emit(AddAdminAccountLoading());
    var response = await accountsRepoImpl.addAdminAccount(
      nameController.text,
      emailController.text,
      passwordController.text,
      phoneController.text,
    );
    response.fold((failure) {
      emit(AddAdminAccountFailere());
    }, (data) {
      AdminsAccountsCubit.get(context).getAdminsAccounts().then((value) {
        customSnackBar(
          context,
          'Addedd Successfully',
          AnimatedSnackBarType.success,
          300,
        );
        pop(context);
      });

      emit(AddAdminAccountSuccess());
    });
  }
}
