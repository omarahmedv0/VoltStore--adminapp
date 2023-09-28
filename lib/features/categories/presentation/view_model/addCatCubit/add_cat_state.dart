part of 'add_cat_cubit.dart';

@immutable
sealed class AddCatState {}

final class AddCatInitial extends AddCatState {}
class UploadImageState extends AddCatState {}

class AddCatSuccess extends AddCatState {}

class AddCatLoading extends AddCatState {}

class AddCatFailere extends AddCatState {}
