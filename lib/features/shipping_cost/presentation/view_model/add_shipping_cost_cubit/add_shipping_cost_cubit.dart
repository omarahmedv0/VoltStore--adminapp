import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../orders/data/models/cities_model/cities_model.dart';
import '../../../data/repos/shipping_cost_repo_impl.dart';
import '../shipping_cost_cubit/shipping_cost_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_shipping_cost_state.dart';

class AddShippingCostCubit extends Cubit<AddShippingCostState> {
  AddShippingCostCubit(this.shippingCostRepoImpl)
      : super(AddShippingCostInitial());

  static AddShippingCostCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  ShippingCostRepoImpl shippingCostRepoImpl;
  TextEditingController costController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String? citySelected;
  
  onCityChanged(String? val) {
    citySelected = val;
    emit(Update());
  }

  getCityID() {
    for (int i = 0; i < citiesModel!.data.length; i++) {
      if (citySelected == citiesModel!.data[i].cityNameEn) {
        return citiesModel!.data[i].cityId!;
      }
    }
  }

  CitiesModel? citiesModel;
  Future<void> getCitiesData() async {
    emit(GetCitiesLoading());
    var response = await shippingCostRepoImpl.getSCitiesData();
    response.fold((failure) {
      emit(GetCitiesFailere());
    }, (data) {
      citiesModel = data;
      emit(GetCitiesSuccss());
    });
  }

  addShippingCost(BuildContext context) async {
    emit(AddShippingCostLoading());
    var response = await shippingCostRepoImpl.addShippingCost(
      getCityID(),
      costController.text,
    );
    response.fold((failure) {
      emit(AddShippingCostFailere());
    }, (data) {
      ShippingCostCubit.get(context).getShippingCostData();
      customSnackBar(
          context, 'Added Successfully', AnimatedSnackBarType.success, 300,);
      pop(context);
      emit(AddShippingCostSuccess());
    });
  }
}
