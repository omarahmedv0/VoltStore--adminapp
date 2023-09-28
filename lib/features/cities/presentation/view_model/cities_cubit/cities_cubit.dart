import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../data/repos/cities_repo_impl.dart';
import '../../../../orders/data/models/cities_model/cities_model.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit(this.citiesRepoImpl) : super(CitiesInitial());
  static CitiesCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  CitiesRepoImpl citiesRepoImpl;

  CitiesModel? citiesModel;
  getCities() async {
    emit(GetCitiesLoading());
    var res = await citiesRepoImpl.getCities();
    res.fold((fail) {
      emit(GetCitiesFailere());
    }, (data) {
      citiesModel = data;
      emit(GetCitiesSuccess());
    });
  }

  deleteCity(BuildContext context,String cityID) async {
    emit(DeleteCitiesLoading());
    var response = await citiesRepoImpl.deleteCity(
     cityID,
    );
    response.fold((failure) {
      emit(DeleteCitiesFailere());
    }, (data) {
     getCities();
      customSnackBar(
        context,
        'Deleted Successfully',
        AnimatedSnackBarType.success,
        300,
      );
      emit(DeleteCitiesSuccess());
    });
  }
}
