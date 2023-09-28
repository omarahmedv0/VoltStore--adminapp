import '../../../data/models/products_model.dart';
import '../../../data/repos/products_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_view_state.dart';

class ProductsViewCubit extends Cubit<ProductsViewState> {
  ProductsViewCubit(this.productsRepoImpl) : super(ProductsViewInitial());

  static ProductsViewCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  ProductsRepoImpl productsRepoImpl;
  ProductsModel? productsModel;

  Future<void> getProductsData() async {
    emit(GetProductsDataLoading());
    var response = await productsRepoImpl.getProductsData();
    response.fold((failure) {
      emit(GetProductsDataFailere());
    }, (data) {
      productsModel = data;
      emit(GetProductsDataSuccess());
    });
  }

  Future<void> deleteProduct(String id, String image) async {
    emit(DeleteProductsLoading());
    var response = await productsRepoImpl.deleteProduct(id, image);
    response.fold((failure) {
      emit(DeleteProductsFailere());
    }, (data) {
      getProductsData();
      emit(DeleteProductsSuccess());
    });
  }
}
