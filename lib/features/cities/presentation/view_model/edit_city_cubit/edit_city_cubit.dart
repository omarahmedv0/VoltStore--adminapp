import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../data/repos/cities_repo_impl.dart';
import '../cities_cubit/cities_cubit.dart';
import '../../../../orders/data/models/cities_model/cities_data.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'edit_city_state.dart';

class EditCityCubit extends Cubit<EditCityState> {
  EditCityCubit(this.citiesRepoImpl) : super(EditCityInitial());
  static EditCityCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  CitiesRepoImpl citiesRepoImpl;

  TextEditingController nameENcontroller = TextEditingController();
  TextEditingController nameARcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  CitiesData? citiesData;
  initialData(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    citiesData = arguments['citiesData'];
    if (nameARcontroller.text.isEmpty) {
      nameENcontroller.text = citiesData!.cityNameEn!;
      nameARcontroller.text = citiesData!.cityNameAr!;
    }
  }

  editCity(BuildContext context) async {
    emit(EditCityLoading());
    var response = await citiesRepoImpl.editCity(
      citiesData!.cityId!,
      nameENcontroller.text,
      nameARcontroller.text,
    );
    response.fold((failure) {
      emit(EditCityFailere());
    }, (data) {
      CitiesCubit.get(context).getCities();
      customSnackBar(
          context, 'Changed Successfully', AnimatedSnackBarType.success, 300);
      pop(context);
      emit(EditCitySuccess());
    });
  }
}
