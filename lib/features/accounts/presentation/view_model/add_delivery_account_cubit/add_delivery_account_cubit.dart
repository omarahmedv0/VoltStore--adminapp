import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../data/repos/accounts_repo_impl.dart';
import '../deliveries_cubit/deliveries_accounts_cubit.dart';

part 'add_delivery_account_state.dart';

class AddDeliveryAccountCubit extends Cubit<AddDeliveryAccountState> {
  AddDeliveryAccountCubit(this.accountsRepoImpl)
      : super(AddDeliveryAccountInitial());

  static AddDeliveryAccountCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  AccountsRepoImpl accountsRepoImpl;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  addDeliveryAccount(BuildContext context) async {
    emit(AddDeliveryAccountLoading());
    var response = await accountsRepoImpl.addDeliveryAccount(
      nameController.text,
      emailController.text,
      passwordController.text,
      phoneController.text,
    );
    response.fold((failure) {
      emit(AddDeliveryAccountFailere());
    }, (data) {
      DeliveriesAccountsCubit.get(context)
          .getDeliveriesAccounts()
          .then((value) {
        customSnackBar(
          context,
          'Addedd Successfully',
          AnimatedSnackBarType.success,
          300,
        );
        pop(context);
      });
      emit(AddDeliveryAccountSuccess());
    });
  }
}
