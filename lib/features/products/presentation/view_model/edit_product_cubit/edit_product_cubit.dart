import 'dart:io';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/upload_file.dart';
import '../../../data/models/products_model.dart';
import '../../../data/repos/products_repo_impl.dart';
import '../products_view_cubit/products_view_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_product_state.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit(this.productsRepoImpl) : super(EditProductInitial());
  static EditProductCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  ProductsRepoImpl productsRepoImpl;
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

  TextEditingController nameEnController = TextEditingController();
  TextEditingController nameArController = TextEditingController();
  TextEditingController descEnController = TextEditingController();
  TextEditingController descArController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountEnController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  ProductData? productData;
  initialData(context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    productData = arguments['productData'];
    if (nameEnController.text.isEmpty) {
      nameEnController.text = productData!.productNameEn!;
      nameArController.text = productData!.productNameAr!;
      descEnController.text = productData!.productDescEn!;
      descArController.text = productData!.productDescAr!;
      countController.text = productData!.productCount!;
      priceController.text = productData!.productOldprice!;
      discountEnController.text = productData!.productDescount!;
    }
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

  Future<void> editProduct(context) async {
    emit(EditProductLoading());
    var response = await productsRepoImpl.editProduct(
      productData!.productId!,
      productData!.productImage!,
      nameEnController.text,
      nameArController.text,
      descEnController.text,
      descArController.text,
      priceController.text,
      discountEnController.text,
      countController.text,
      color1Seleted ?? '',
      color2Seleted ?? '',
      color3Seleted ?? '',
      size1Seleted ?? '',
      size2Seleted ?? '',
      size3Seleted ?? '',
     image: file,
    );
    response.fold((failure) {
      emit(EditProductFailere());
    }, (data) {
      customSnackBar(
          context, 'Edited Successfully', AnimatedSnackBarType.success, 300);
      ProductsViewCubit.get(context).getProductsData();
      pop(context);
      emit(EditProductSuccess());
    });
  }

 
}
