part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class Update extends AddProductState {}

class AddProductSuccess extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductFailere extends AddProductState {}
