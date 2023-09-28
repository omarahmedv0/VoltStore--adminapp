import '../../../data/models/cities_model/cities_data.dart';
import '../../../data/models/order_details_model/order_details_model.dart';
import '../../../data/repos/orders_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.ordersRepoImpl) : super(OrderDetailsInitial());
  static OrderDetailsCubit get(context) {
    return BlocProvider.of(context);
  }

  OrdersRepoImpl ordersRepoImpl;
  OrderDetailsModel? orderDetailsData;
  Future<void> getOrderDetailsData(String orderID) async {
    emit(GetOrderDetailsLoading());
    var response = await ordersRepoImpl.getOrderDetails(orderID);
    response.fold((failure) {
      emit(GetOrderDetailsFailere());
    }, (data) {
      orderDetailsData = data;
      emit(GetOrderDetailsSuccess());
    });
  }

  getCityName(String cityID) {
    for (int i = 0; i < citiesData.length; i++) {
      if (cityID == citiesData[i].cityId) {
        return citiesData[i].cityNameEn;
      }
    }
  }

  List<CitiesData> citiesData = [];
  getCities() async {
    emit(GetCitiesDataLoading());
    var response = await ordersRepoImpl.getCities();
    response.fold((failere) {
      emit(GetCitiesDataFailere());
    }, (data) {
      citiesData = data.data;
      emit(GetCitiesDataSuccess());
    });
  }
}
