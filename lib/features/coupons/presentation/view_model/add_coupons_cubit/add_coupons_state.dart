part of 'add_coupons_cubit.dart';

@immutable
sealed class AddCouponsState {}

final class AddCouponsInitial extends AddCouponsState {}

final class AddCouponSuccess extends AddCouponsState {}

final class AddCouponLoading extends AddCouponsState {}

final class AddCouponFailere extends AddCouponsState {}

final class Update extends AddCouponsState {}
