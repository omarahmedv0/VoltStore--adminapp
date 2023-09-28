part of 'orders_prepared_cubit.dart';

@immutable
sealed class OrdersPreparedState {}

final class OrdersPreparedInitial extends OrdersPreparedState {}

final class GetOrdersPreparedSuccess extends OrdersPreparedState {}

final class GetOrdersPreparedLoading extends OrdersPreparedState {}

final class GetOrdersPreparedFailere extends OrdersPreparedState {}


final class PreparedOrderSuccess extends OrdersPreparedState {}

final class PreparedOrderLoading extends OrdersPreparedState {}

final class PreparedOrderFailere extends OrdersPreparedState {}
