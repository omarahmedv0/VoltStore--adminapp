import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../data/repos/cities_repo_impl.dart';
import '../cities_cubit/cities_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_city_state.dart';

class AddCityCubit extends Cubit<AddCityState> {
  AddCityCubit(this.citiesRepoImpl) : super(AddCityInitial());
  static AddCityCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  CitiesRepoImpl citiesRepoImpl;
  TextEditingController nameENcontroller = TextEditingController();
  TextEditingController nameARcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  addCity(BuildContext context) async {
    emit(AddCityLoading());
    var response = await citiesRepoImpl.addCity(
      nameENcontroller.text,
      nameARcontroller.text,
    );
    response.fold((failure) {
      emit(AddCityFailere());
    }, (data) {
      CitiesCubit.get(context).getCities();
      customSnackBar(
          context, 'Added Successfully', AnimatedSnackBarType.success, 300);
          pop(context);
      emit(AddCitySuccess());
    });
  }
}
