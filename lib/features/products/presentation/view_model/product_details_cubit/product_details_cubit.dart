import '../../../data/models/products_model.dart';
import '../../../data/repos/products_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.productsRepoImpl) : super(ProductDetailsInitial());
  static ProductDetailsCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }
ProductsRepoImpl productsRepoImpl;
  ProductData? productDetails;
  initialData(context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    productDetails = arguments['productDetails'];
  }
    List<String> productColors = [];
  List<String> productSize = [];



  Future<void> getProductColors(String id) async {
    emit(GetProductColorLoading());
    var response = await productsRepoImpl.getProductColor(id);
    response.fold((failure) {
      emit(GetProductColorFailere());
    }, (data) {
      productColors = data.data!;
      emit(GetProductColorSuccess());
    });
  }

  Future<void> getProductSize(String id) async {
    emit(GetProductSizeLoading());
    var response = await productsRepoImpl.getProductSize(id);
    response.fold((failure) {
      emit(GetProductSizeFailere());
    }, (data) {
      productSize = data.data!;
      emit(GetProductSizeSuccess());
    });
  }
}
