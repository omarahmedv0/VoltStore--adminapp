part of 'edit_delivery_account_cubit.dart';

@immutable
sealed class EditDeliveryAccountState {}

final class EditDeliveryAccountInitial extends EditDeliveryAccountState {}


final class EditDeliveryAccountSuccess extends EditDeliveryAccountState {}
final class EditDeliveryAccountFailere extends EditDeliveryAccountState {}
final class EditDeliveryAccountLoading extends EditDeliveryAccountState {}
