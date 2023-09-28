part of 'edit_product_cubit.dart';

@immutable
sealed class EditProductState {}

final class EditProductInitial extends EditProductState {}

final class Update extends EditProductState {}

class EditProductSuccess extends EditProductState {}

class EditProductLoading extends EditProductState {}

class EditProductFailere extends EditProductState {}
