part of 'edit_city_cubit.dart';

@immutable
sealed class EditCityState {}

final class EditCityInitial extends EditCityState {}

final class EditCitySuccess extends EditCityState {}

final class EditCityFailere extends EditCityState {}

final class EditCityLoading extends EditCityState {}
