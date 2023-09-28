part of 'coupons_cubit.dart';

@immutable
sealed class CouponsState {}

final class CouponsInitial extends CouponsState {}

final class GetCouponSuccss extends CouponsState {}

final class GetCouponLoading extends CouponsState {}

final class GetCouponFailere extends CouponsState {}


final class DeleteCouponSuccss extends CouponsState {}

final class DeleteCouponLoading extends CouponsState {}

final class DeleteCouponFailere extends CouponsState {}
