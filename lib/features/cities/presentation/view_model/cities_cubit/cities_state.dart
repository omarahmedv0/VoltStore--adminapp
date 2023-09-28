part of 'cities_cubit.dart';

@immutable
sealed class CitiesState {}

final class CitiesInitial extends CitiesState {}

final class GetCitiesSuccess extends CitiesState {}

final class GetCitiesLoading extends CitiesState {}

final class GetCitiesFailere extends CitiesState {}

final class DeleteCitiesSuccess extends CitiesState {}

final class DeleteCitiesLoading extends CitiesState {}

final class DeleteCitiesFailere extends CitiesState {}
