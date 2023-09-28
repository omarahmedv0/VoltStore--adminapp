part of 'shipping_cost_cubit.dart';

@immutable
sealed class ShippingCostState {}

final class ShippingCostInitial extends ShippingCostState {}

final class GetShippingCostSuccss extends ShippingCostState {}

final class GetShippingCostLoading extends ShippingCostState {}

final class GetShippingCostFailere extends ShippingCostState {}


final class DeleteShippingCostSuccss extends ShippingCostState {}

final class DeleteShippingCostLoading extends ShippingCostState {}

final class DeleteShippingCostFailere extends ShippingCostState {}
