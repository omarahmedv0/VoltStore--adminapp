part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class GetProductColorSuccess extends ProductDetailsState {}

final class GetProductColorFailere extends ProductDetailsState {}

final class GetProductColorLoading extends ProductDetailsState {}

final class GetProductSizeSuccess extends ProductDetailsState {}

final class GetProductSizeFailere extends ProductDetailsState {}

final class GetProductSizeLoading extends ProductDetailsState {}
