import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../data/models/delivey_account_model.dart';
import '../../../data/repos/accounts_repo_impl.dart';
import '../deliveries_cubit/deliveries_accounts_cubit.dart';

part 'edit_delivery_account_state.dart';

class EditDeliveryAccountCubit extends Cubit<EditDeliveryAccountState> {
  EditDeliveryAccountCubit(this.accountsRepoImpl)
      : super(EditDeliveryAccountInitial());

  static EditDeliveryAccountCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  AccountsRepoImpl accountsRepoImpl;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? deliveryID;
  GlobalKey<FormState> formKey = GlobalKey();
  DeliveryData? deliveryData;
  initialData(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    deliveryData = arguments['deliveryAccountData'];
    if (nameController.text.isEmpty) {
      nameController.text = deliveryData!.deliveryName!;
      phoneController.text = deliveryData!.deliveryPhone!;
      emailController.text = deliveryData!.deliveryEmail!;
      passwordController.text = deliveryData!.deliveryPassword!;
      deliveryID = deliveryData!.deliveryId;
    }
  }

  editDeliveryAccount(BuildContext context) async {
    emit(EditDeliveryAccountLoading());
    var response = await accountsRepoImpl.editDeliveryAccount(
      deliveryID!,
      nameController.text,
      emailController.text,
      passwordController.text,
      phoneController.text,
    );
    response.fold((failure) {
      emit(EditDeliveryAccountFailere());
    }, (data) {
      DeliveriesAccountsCubit.get(context)
          .getDeliveriesAccounts()
          .then((value) {
        customSnackBar(
          context,
          'Changed Successfully',
          AnimatedSnackBarType.success,
          300,
        );
        pop(context);
      });

      emit(EditDeliveryAccountSuccess());
    });
  }
}
