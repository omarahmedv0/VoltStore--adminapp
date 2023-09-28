part of 'add_delivery_account_cubit.dart';

@immutable
sealed class AddDeliveryAccountState {}

final class AddDeliveryAccountInitial extends AddDeliveryAccountState {}

final class AddDeliveryAccountSuccess extends AddDeliveryAccountState {}

final class AddDeliveryAccountFailere extends AddDeliveryAccountState {}

final class AddDeliveryAccountLoading extends AddDeliveryAccountState {}
