part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

class GetCatgoriesDataSuccess extends CategoriesState {}

class GetCatgoriesDataFailere extends CategoriesState {}

class GetCatgoriesDataLoading extends CategoriesState {}

class DeleteCatSuccess extends CategoriesState {}

class DeleteCatLoading extends CategoriesState {}

class DeleteCatFailere extends CategoriesState {}
