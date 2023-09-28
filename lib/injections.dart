import 'features/accounts/data/repos/accounts_repo_impl.dart';
import 'features/categories/data/repos/categories_repo_impl.dart';
import 'features/cities/data/repos/cities_repo_impl.dart';
import 'features/coupons/data/repos/coupons_repo_impl.dart';
import 'features/orders/data/repos/orders_repo_impl.dart';
import 'features/products/data/repos/products_repo_impl.dart';
import 'features/shipping_cost/data/repos/shipping_cost_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'core/class/api/api_service.dart';
import 'features/auth/data/repos/login_repo/login_repo_impl.dart';

final getIt = GetIt.instance;

void initialInjections() {
// Networking
  getIt.registerSingleton<Client>(Client());

  // API Services
  getIt.registerSingleton<ApiService>(ApiService(
    client: getIt.get<Client>(),
  ));

  // Repos
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));
  
  getIt.registerSingleton<CategoriesRepoImpl>(CategoriesRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<ProductsRepoImpl>(ProductsRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<OrdersRepoImpl>(OrdersRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<AccountsRepoImpl>(AccountsRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

 getIt.registerSingleton<CitiesRepoImpl>(CitiesRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

 getIt.registerSingleton<ShippingCostRepoImpl>(ShippingCostRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));

 getIt.registerSingleton<CouponsRepoImpl>(CouponsRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));


}
