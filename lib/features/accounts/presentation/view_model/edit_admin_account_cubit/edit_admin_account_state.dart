part of 'edit_admin_account_cubit.dart';

@immutable
sealed class EditAdminAccountState {}

final class EditAdminAccountInitial extends EditAdminAccountState {}

final class EditAdminAccountSuccess extends EditAdminAccountState {}
final class EditAdminAccountFailere extends EditAdminAccountState {}
final class EditAdminAccountLoading extends EditAdminAccountState {}
