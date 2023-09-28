import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../data/models/coupon_model.dart';
import '../../../data/repos/coupons_repo_impl.dart';

part 'coupons_state.dart';

class CouponsCubit extends Cubit<CouponsState> {
  CouponsCubit(this.couponsRepoImpl) : super(CouponsInitial());
  static CouponsCubit get(BuildContext context)
  {
    return BlocProvider.of(context);
  }
  CouponsRepoImpl couponsRepoImpl;


  CouponModel? couponModel;
  Future<void> getCouponsData() async {
    emit(GetCouponLoading());
    var response = await couponsRepoImpl.getCoupons();
    response.fold((failure) {
      emit(GetCouponFailere());
    }, (data) {
      couponModel = data;
      emit(GetCouponSuccss());
    });
  }

  deleteCoupon(BuildContext context, String couponID) async {
    emit(DeleteCouponLoading());
    var response = await couponsRepoImpl.deleteCoupon(
      couponID,
    );
    response.fold((failure) {
      emit(DeleteCouponFailere());
    }, (data) {
      customSnackBar(
        context,
        'Deleted Successfully',
        AnimatedSnackBarType.success,
        300,
      );
      getCouponsData();
      emit(DeleteCouponSuccss());
    });
  }
}
