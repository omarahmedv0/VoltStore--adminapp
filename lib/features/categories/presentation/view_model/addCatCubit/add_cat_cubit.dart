import 'dart:io';

import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/upload_file.dart';
import '../../../data/repos/categories_repo_impl.dart';
import '../categories_view_cubit/categories_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_cat_state.dart';

class AddCatCubit extends Cubit<AddCatState> {
  AddCatCubit(this.categoriesRepoImpl) : super(AddCatInitial());

 static AddCatCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  CategoriesRepoImpl categoriesRepoImpl;

  TextEditingController nameEnController = TextEditingController();
  TextEditingController nameArController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  File? file;
  chooseImage() async {
    file = await uploadFile();
    emit(UploadImageState());
  }

  Future<void> addCat(context) async {
    emit(AddCatLoading());
    var response = await categoriesRepoImpl.addCat(
      nameEnController.text,
      nameArController.text,
      file!,
    );
    response.fold((failure) {
      emit(AddCatFailere());
    }, (data) {
      customSnackBar(context, 'Addedd Successfully', AnimatedSnackBarType.success, 300);
   CategoriesCubit.get(context). getCategoriesData();
      pop(context);
      emit(AddCatSuccess());
    });
  }
}
