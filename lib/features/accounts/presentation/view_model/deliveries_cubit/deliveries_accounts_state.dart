part of 'deliveries_accounts_cubit.dart';

@immutable
sealed class DeliveriesAccountsState {}

final class DeliveriesAccountsInitial extends DeliveriesAccountsState {}

final class GetDeliveriesAccountsSuccess extends DeliveriesAccountsState {}

final class GetDeliveriesAccountsLoading extends DeliveriesAccountsState {}

final class GetDeliveriesAccountsFailere extends DeliveriesAccountsState {}

final class DeleteDeliveryAccountSuccess extends DeliveriesAccountsState {}

final class DeleteDeliveryAccountFailere extends DeliveriesAccountsState {}

final class DeleteDeliveryAccountLoading extends DeliveriesAccountsState {}
