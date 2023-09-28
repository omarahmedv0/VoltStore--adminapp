part of 'add_shipping_cost_cubit.dart';

@immutable
sealed class AddShippingCostState {}

final class AddShippingCostInitial extends AddShippingCostState {}

final class GetCitiesSuccss extends AddShippingCostState {}

final class GetCitiesLoading extends AddShippingCostState {}

final class GetCitiesFailere extends AddShippingCostState {}

final class AddShippingCostSuccess extends AddShippingCostState {}

final class AddShippingCostLoading extends AddShippingCostState {}

final class AddShippingCostFailere extends AddShippingCostState {}

final class Update extends AddShippingCostState {}
