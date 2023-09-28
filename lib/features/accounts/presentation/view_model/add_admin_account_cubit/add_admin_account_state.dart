part of 'add_admin_account_cubit.dart';

@immutable
sealed class AddAdminAccountState {}

final class AddAdminAccountInitial extends AddAdminAccountState {}

final class AddAdminAccountSuccess extends AddAdminAccountState {}
final class AddAdminAccountFailere extends AddAdminAccountState {}
final class AddAdminAccountLoading extends AddAdminAccountState {}
