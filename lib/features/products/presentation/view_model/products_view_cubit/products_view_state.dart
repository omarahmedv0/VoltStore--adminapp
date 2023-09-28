part of 'products_view_cubit.dart';

@immutable
sealed class ProductsViewState {}

final class ProductsViewInitial extends ProductsViewState {}

final class ProductsInitial extends ProductsViewState {}

class GetProductsDataSuccess extends ProductsViewState {}

class GetProductsDataFailere extends ProductsViewState {}

class GetProductsDataLoading extends ProductsViewState {}

class DeleteProductsSuccess extends ProductsViewState {}

class DeleteProductsLoading extends ProductsViewState {}

class DeleteProductsFailere extends ProductsViewState {}
