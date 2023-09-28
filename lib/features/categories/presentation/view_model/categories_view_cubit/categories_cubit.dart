import '../../../data/models/category_model.dart';
import '../../../data/repos/categories_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepoImpl) : super(CategoriesInitial());
  static CategoriesCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  CategoriesRepoImpl categoriesRepoImpl;
  CategoryModel? categoryModel;

  Future<void> getCategoriesData() async {
    emit(GetCatgoriesDataLoading());
    var response = await categoriesRepoImpl.getCategoriesData();
    response.fold((failure) {
      emit(GetCatgoriesDataFailere());
    }, (data) {
      categoryModel = data;
      emit(GetCatgoriesDataSuccess());
    });
  }

  Future<void> deleteCategory(context, String id, String oldImage) async {
    emit(DeleteCatLoading());
    var response = await categoriesRepoImpl.daleteCat(id, oldImage);
    response.fold((failure) {
      emit(DeleteCatFailere());
    }, (data) {
      getCategoriesData();
      emit(DeleteCatSuccess());
    });
  }
}
