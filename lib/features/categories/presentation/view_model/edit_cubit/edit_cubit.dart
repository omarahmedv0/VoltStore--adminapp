import 'dart:io';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/upload_file.dart';
import '../../../data/models/category_model.dart';
import '../../../data/repos/categories_repo_impl.dart';
import '../categories_view_cubit/categories_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_state.dart';

class EditCatCubit extends Cubit<EditCatState> {
  EditCatCubit(this.categoriesRepoImpl) : super(EditInitial());

  static EditCatCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  File? file;
  chooseImage() async {
    file = await uploadFile();
    emit(UploadImageState());
  }

  CategoriesRepoImpl categoriesRepoImpl;

  TextEditingController nameEnController = TextEditingController();
  TextEditingController nameArController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

String? oldImage;
String? catID;
  initialData(context) {
    CategoryData? categoryData;
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    categoryData = arguments['catData'];
    if (nameEnController.text.isEmpty) {
      nameEnController.text = categoryData!.categoryNameEn!;
      nameArController.text = categoryData.categoryNameAr!;
      catID = categoryData.categoryId!;
      oldImage =categoryData.image!;
    }
  }

  Future<void> editCat(context) async {
    emit(EditCatLoading());
    var response = await categoriesRepoImpl.editCat(
      nameEnController.text,
      nameArController.text,
      catID!,
      oldImage!,
      file: file,
    );
    response.fold((failure) {
      emit(EditCatFailere());
    }, (data) {
      customSnackBar(
          context, 'Successfully', AnimatedSnackBarType.success, 300);
      CategoriesCubit.get(context).getCategoriesData();
      pop(context);
      emit(EditCatSuccess());
    });
  }
}
