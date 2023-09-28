part of 'add_city_cubit.dart';

@immutable
sealed class AddCityState {}

final class AddCityInitial extends AddCityState {}

final class AddCitySuccess extends AddCityState {}
final class AddCityLoading extends AddCityState {}
final class AddCityFailere extends AddCityState {}
