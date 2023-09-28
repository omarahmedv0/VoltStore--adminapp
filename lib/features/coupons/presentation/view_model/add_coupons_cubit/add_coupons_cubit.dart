import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../data/repos/coupons_repo_impl.dart';
import '../coupons_cubit/coupons_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_coupons_state.dart';

class AddCouponsCubit extends Cubit<AddCouponsState> {
  AddCouponsCubit(this.couponsRepoImpl) : super(AddCouponsInitial());
  static AddCouponsCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  CouponsRepoImpl couponsRepoImpl;
  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  GlobalKey<FormState >formKey = GlobalKey();
  DateTime? expireDate;
  onChangeExpireDate(DateTime? val) {
    expireDate = val;
    emit(Update());
  }

  addCoupon(BuildContext context) async {
    emit(AddCouponLoading());
    var response = await couponsRepoImpl.addCoupon(
      nameController.text,
      countController.text,
      discountController.text,
      expireDate.toString(),
    );
    response.fold((failure) {
      emit(AddCouponFailere());
    }, (data) {
      CouponsCubit.get(context).getCouponsData();
      customSnackBar(
        context,
        'Added Successfully',
        AnimatedSnackBarType.success,
        300,
      );
      pop(context);
      emit(AddCouponSuccess());
    });
  }
}
