part of 'orders_indelivery_cubit.dart';

@immutable
sealed class OrdersIndeliveryState {}

final class OrdersIndeliveryInitial extends OrdersIndeliveryState {}

final class GetOrdersDeliverySuccess extends OrdersIndeliveryState {}

final class GetOrdersDeliveryLoading extends OrdersIndeliveryState {}

final class GetOrdersDeliveryFailere extends OrdersIndeliveryState {}
