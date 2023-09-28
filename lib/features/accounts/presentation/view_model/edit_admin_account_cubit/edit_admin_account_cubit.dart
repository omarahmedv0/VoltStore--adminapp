import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../data/models/admin_account_model.dart';
import '../../../data/repos/accounts_repo_impl.dart';
import '../admins_cubit/admins_accounts_cubit.dart';

part 'edit_admin_account_state.dart';

class EditAdminAccountCubit extends Cubit<EditAdminAccountState> {
  EditAdminAccountCubit(this.accountsRepoImpl)
      : super(EditAdminAccountInitial());
  static EditAdminAccountCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  AccountsRepoImpl accountsRepoImpl;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AdminData? adminData;
  String? adminID;
  initialData(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    adminData = arguments['adminAccountData'];
    if (nameController.text.isEmpty) {
      adminID = adminData!.adminId;
      nameController.text = adminData!.adminName!;
      phoneController.text = adminData!.adminPhone!;
      emailController.text = adminData!.adminEmail!;
      passwordController.text = adminData!.adminPassword!;
    }
  }

  editAdminAccount(BuildContext context) async {
    emit(EditAdminAccountLoading());
    var response = await accountsRepoImpl.editAdminAccount(
      adminID!,
      nameController.text,
      emailController.text,
      passwordController.text,
      phoneController.text,
    );
    response.fold((failure) {
      emit(EditAdminAccountFailere());
    }, (data) {
      AdminsAccountsCubit.get(context).getAdminsAccounts().then((value) {
        customSnackBar(
          context,
          'Changed Successfully',
          AnimatedSnackBarType.success,
          300,
        );
        pop(context);
      });

      emit(EditAdminAccountSuccess());
    });
  }
}
