part of 'admins_accounts_cubit.dart';

@immutable
sealed class AdminsAccountsState {}

final class AdminsAccountsInitial extends AdminsAccountsState {}

final class GetAdminsAccountsSuccess extends AdminsAccountsState {}

final class GetAdminsAccountsLoading extends AdminsAccountsState {}

final class GetAdminsAccountsFailere extends AdminsAccountsState {}

final class DeleteAdminAccountSuccess extends AdminsAccountsState {}

final class DeleteAdminAccountFailere extends AdminsAccountsState {}

final class DeleteAdminAccountLoading extends AdminsAccountsState {}
