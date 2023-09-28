part of 'edit_cubit.dart';

@immutable
sealed class EditCatState {}

final class EditInitial extends EditCatState {}

final class UploadImageState extends EditCatState {}

class EditCatSuccess extends EditCatState {}

class EditCatLoading extends EditCatState {}

class EditCatFailere extends EditCatState {}
