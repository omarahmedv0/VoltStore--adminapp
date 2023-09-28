part of 'orders_received_cubit.dart';

@immutable
sealed class OrdersReceivedState {}

final class OrdersReceivedInitial extends OrdersReceivedState {}
final class GetOrdersReceivedSuccess extends OrdersReceivedState {}

final class GetOrdersReceivedLoading extends OrdersReceivedState {}

final class GetOrdersReceivedFailere extends OrdersReceivedState {}
