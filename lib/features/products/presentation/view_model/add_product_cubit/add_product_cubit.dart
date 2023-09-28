import 'dart:io';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/upload_file.dart';
import '../../../data/repos/products_repo_impl.dart';
import '../products_view_cubit/products_view_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.productsRepoImpl) : super(AddProductInitial());
  static AddProductCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<String> categoriesList = [
    'popular',
    'Newest',
    'Man',
    'Woman',
  ];
  List<String> colorList = [
    'red',
    'black',
    'white',
    'yellow',
    'blue',
    'brown',
  ];
  List<String> sizeList = [
    'small',
    'medium',
    'large',
  ];

  ProductsRepoImpl productsRepoImpl;
  TextEditingController nameEnController = TextEditingController();
  TextEditingController nameArController = TextEditingController();
  TextEditingController descEnController = TextEditingController();
  TextEditingController descArController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountEnController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  String? category1Seleted;
  onCategory1Changed(String? val) {
    category1Seleted = val;
    emit(Update());
  }

  String? category2Seleted;
  onCategory2Changed(String? val) {
    category2Seleted = val;
    emit(Update());
  }

  String? color1Seleted;
  onColor1Changed(String? val) {
    color1Seleted = val;
    emit(Update());
  }

  String? color2Seleted;
  onColor2Changed(String? val) {
    color2Seleted = val;
    emit(Update());
  }

  String? color3Seleted;
  onColor3Changed(String? val) {
    color3Seleted = val;
    emit(Update());
  }

  String? size1Seleted;
  onsize1Changed(String? val) {
    size1Seleted = val;
    emit(Update());
  }

  String? size2Seleted;
  onsize2Changed(String? val) {
    size2Seleted = val;
    emit(Update());
  }

  String? size3Seleted;
  onsize3Changed(String? val) {
    size3Seleted = val;
    emit(Update());
  }

  File? file;
  chooseImage() async {
    file = await uploadFile();
    emit(Update());
  }

  Future<void> addProduct(context) async {
    emit(AddProductLoading());
    var response = await productsRepoImpl.addProduct(
        nameEnController.text,
        nameArController.text,
        descEnController.text,
        descArController.text,
        priceController.text,
        discountEnController.text,
        countController.text,
        checkCategories(category1Seleted) ,
        checkCategories(category2Seleted),
        color1Seleted ?? '',
        color2Seleted ?? '',
        color3Seleted ?? '',
        size1Seleted ?? '',
        size2Seleted ?? '',
        size3Seleted ?? '',
        file!);
    response.fold((failure) {
      emit(AddProductFailere());
    }, (data) {
      customSnackBar(
          context, 'Addedd Successfully', AnimatedSnackBarType.success, 300);
      ProductsViewCubit.get(context).getProductsData();
      pop(context);
      emit(AddProductSuccess());
    });
  }

  String checkCategories(String? cat) {
    switch (cat) {
      case 'Newest':
        return '2';
      case 'popular':
        return '3';
      case 'Man':
        return '4';
      case 'Woman':
        return '5';
        default:
        return '';
    }
  }
}
