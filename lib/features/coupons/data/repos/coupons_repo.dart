import '../../../../core/class/api/failures.dart';
import '../models/coupon_model.dart';
import 'package:dartz/dartz.dart';

abstract class CouponsRepo {
  Future<Either<Failure, CouponModel>> getCoupons();
  Future<Either<Failure, Map>> addCoupon(
    String couponeName,
    String count,
    String discount,
    String expiredate,
  );
  Future<Either<Failure, Map>> deleteCoupon(
    String couponeID,
  );
}
