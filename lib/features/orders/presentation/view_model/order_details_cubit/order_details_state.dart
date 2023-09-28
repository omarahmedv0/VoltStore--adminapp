part of 'order_details_cubit.dart';

sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}

final class GetOrderDetailsSuccess extends OrderDetailsState {}

final class GetOrderDetailsLoading extends OrderDetailsState {}

final class GetOrderDetailsFailere extends OrderDetailsState {}

class GetCitiesDataSuccess extends OrderDetailsState {}

class GetCitiesDataFailere extends OrderDetailsState {}

class GetCitiesDataLoading extends OrderDetailsState {}
