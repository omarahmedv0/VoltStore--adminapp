// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:adminapp/core/class/api/api_service.dart';
import 'package:adminapp/core/class/api/failures.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/features/coupons/data/models/coupon_model.dart';
import 'package:adminapp/features/coupons/data/repos/coupons_repo.dart';

class CouponsRepoImpl implements CouponsRepo {
  ApiService apiService;
  CouponsRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, Map>> addCoupon(
    String couponeName,
    String count,
    String discount,
    String expiredate,
  ) async {
    try {
      var response = await apiService.postData(
        ApiLinks.addCoupon,
        {
          'name': couponeName,
          'count': count,
          'date': expiredate,
          'discount': discount,
        },
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          data,
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> deleteCoupon(String couponeID) async {
    try {
      var response = await apiService.postData(
        ApiLinks.deleteCoupon,
        {
          'id': couponeID,
        },
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          data,
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, CouponModel>> getCoupons() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getCoupons,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(CouponModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
