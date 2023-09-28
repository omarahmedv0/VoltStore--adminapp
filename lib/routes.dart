import 'features/accounts/data/repos/accounts_repo_impl.dart';
import 'features/accounts/presentation/view/screens/accounts_screen.dart';
import 'features/accounts/presentation/view/screens/admins/admins_accounts_screen.dart';
import 'features/accounts/presentation/view/screens/admins/add_admin_account_screen.dart';
import 'features/accounts/presentation/view/screens/admins/edit_admin_account_screen.dart';
import 'features/accounts/presentation/view/screens/deliveries/deliveries_accounts_screen.dart';
import 'features/accounts/presentation/view/screens/deliveries/add_delivery_account_screen.dart';
import 'features/accounts/presentation/view/screens/deliveries/edit_delivery_account_screen.dart';
import 'features/accounts/presentation/view_model/add_admin_account_cubit/add_admin_account_cubit.dart';
import 'features/accounts/presentation/view_model/add_delivery_account_cubit/add_delivery_account_cubit.dart';
import 'features/accounts/presentation/view_model/edit_admin_account_cubit/edit_admin_account_cubit.dart';
import 'features/accounts/presentation/view_model/edit_delivery_cubit/edit_delivery_account_cubit.dart';
import 'features/auth/presentation/view/screens/login/login_screen.dart';
import 'features/categories/data/repos/categories_repo_impl.dart';
import 'features/categories/presentation/view/screens/add_cat_screen.dart';
import 'features/categories/presentation/view/screens/categories_screen.dart';
import 'features/categories/presentation/view/screens/edit_cat_screen.dart';
import 'features/categories/presentation/view_model/addCatCubit/add_cat_cubit.dart';
import 'features/categories/presentation/view_model/edit_cubit/edit_cubit.dart';
import 'features/cities/data/repos/cities_repo_impl.dart';
import 'features/cities/presentation/view/screens/add_city_screen.dart';
import 'features/cities/presentation/view/screens/cities_screen.dart';
import 'features/cities/presentation/view/screens/edit_city_screen.dart';
import 'features/cities/presentation/view_model/add_city_cubit/add_city_cubit.dart';
import 'features/cities/presentation/view_model/edit_city_cubit/edit_city_cubit.dart';
import 'features/coupons/data/repos/coupons_repo_impl.dart';
import 'features/coupons/presentation/view/screens/add_coupon_screen.dart';
import 'features/coupons/presentation/view/screens/coupons_screen.dart';
import 'features/coupons/presentation/view_model/add_coupons_cubit/add_coupons_cubit.dart';
import 'features/home/presentation/view/screens/home_screen.dart';
import 'features/orders/data/repos/orders_repo_impl.dart';
import 'features/orders/presentation/view/screens/order_details_screen.dart';
import 'features/orders/presentation/view/screens/orders_pending_screen.dart';
import 'features/orders/presentation/view/screens/orders_in_delivery_screen.dart';
import 'features/orders/presentation/view/screens/orders_prepared_screen.dart';
import 'features/orders/presentation/view/screens/orders_received.dart';
import 'features/orders/presentation/view/screens/orders_screen.dart';
import 'features/orders/presentation/view_model/orders_delivery_cubit/orders_indelivery_cubit.dart';
import 'features/orders/presentation/view_model/orders_prepared_cubit/orders_prepared_cubit.dart';
import 'features/orders/presentation/view_model/orders_received_cubit/orders_received_cubit.dart';
import 'features/products/data/repos/products_repo_impl.dart';
import 'features/products/presentation/view/screens/add_product.dart';
import 'features/products/presentation/view/screens/edit_product_screen.dart';
import 'features/products/presentation/view/screens/product_details_screen.dart';
import 'features/products/presentation/view/screens/products_view_screen.dart';
import 'features/products/presentation/view_model/add_product_cubit/add_product_cubit.dart';
import 'features/products/presentation/view_model/edit_product_cubit/edit_product_cubit.dart';
import 'features/shipping_cost/data/repos/shipping_cost_repo_impl.dart';
import 'features/shipping_cost/presentation/view/screens/add_shipping_cost.dart';
import 'features/shipping_cost/presentation/view/screens/shipping_cost_screen.dart';
import 'features/shipping_cost/presentation/view_model/add_shipping_cost_cubit/add_shipping_cost_cubit.dart';
import 'injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/route_manager.dart';

Map<String, Widget Function(BuildContext)> routes = {
  RouteManager.login: (c) => const LoginScreen(),
  RouteManager.home: (c) => const HomeScreen(),
  RouteManager.categories: (c) => const CategoriesScreen(),
  RouteManager.addCat: (c) => BlocProvider(
        create: (context) => AddCatCubit(getIt.get<CategoriesRepoImpl>()),
        child: AddCatScreen(),
      ),
  RouteManager.editCat: (c) => BlocProvider(
        create: (context) => EditCatCubit(getIt.get<CategoriesRepoImpl>()),
        child: const EditCatScreen(),
      ),
  RouteManager.products: (c) => const ProductsScreen(),
  RouteManager.productsDetails: (c) => const ProductDetailsScreen(),
  RouteManager.addProduct: (c) => BlocProvider(
        create: (context) => AddProductCubit(getIt.get<ProductsRepoImpl>()),
        child: const AddProductScreen(),
      ),
  RouteManager.editProduct: (c) => BlocProvider(
        create: (context) => EditProductCubit(getIt.get<ProductsRepoImpl>()),
        child: const EditProductScreen(),
      ),
  RouteManager.orders: (c) => const OrdersScreen(),
  RouteManager.ordersApproval: (c) => const OrdersPendingScreen(),
  RouteManager.ordersPrepared: (c) => BlocProvider(
        create: (context) =>
           OrdersPreparedCubit(getIt.get<OrdersRepoImpl>())..getOrdersPreparedData(),
        child: const OrdersPreparedScreen(),
      ),
  RouteManager.ordersDelivery: (c) => BlocProvider(
        create: (context) =>
           OrdersIndeliveryCubit(getIt.get<OrdersRepoImpl>())..getOrdersDeliveryData(),
        child: const OrdersInDeliveryScreen(),
      ),
  RouteManager.ordersReceived: (c) => BlocProvider(
        create: (context) =>
           OrdersReceivedCubit(getIt.get<OrdersRepoImpl>())..getOrdersReceivedData(),
        child: const OrdersReceivedScreen(),
      ),
  RouteManager.orderDetails: (c) => const OrderDetailsScreen(),
  RouteManager.accounts: (c) => const AccountsScreen(),
  RouteManager.adminsAccounts: (c) => const AdminsAccountsScreen(),
  RouteManager.deliveriesAccounts: (c) => const DeliveriesAccountsScreen(),
  RouteManager.addAdminAccount: (c) => BlocProvider(
        create: (context) => AddAdminAccountCubit(getIt.get<AccountsRepoImpl>()),
        child: const AddAdminAccountScreen(),
      ),
  RouteManager.addDeliveryAccount: (c) => BlocProvider(
        create: (context) =>AddDeliveryAccountCubit(getIt.get<AccountsRepoImpl>()),
        child: const AddDeliveryAccountScreen(),
      ),
  RouteManager.editAdminAccount: (c) => BlocProvider(
        create: (context) => EditAdminAccountCubit(getIt.get<AccountsRepoImpl>()),
        child: const EditAdminAccountScreen(),
      ),
  RouteManager.editDeliveryAccount: (c) => BlocProvider(
        create: (context) => EditDeliveryAccountCubit(getIt.get<AccountsRepoImpl>()),
        child: const EditDeliveryAccountScreen(),
      ),
  RouteManager.cities: (c) => const CitiesScreen(),
  RouteManager.addCity: (c) => BlocProvider(
        create: (context) => AddCityCubit(getIt.get<CitiesRepoImpl>()),
        child: const AddCityScreen(),
      ),
  RouteManager.editCity: (c) => BlocProvider(
        create: (context) => EditCityCubit(getIt.get<CitiesRepoImpl>()),
        child: const EditCityScreen(),
      ),
  RouteManager.shippingCost: (c) => const ShippingCostScreen(),
  RouteManager.addShippingCost: (c) => BlocProvider(
        create: (context) => AddShippingCostCubit(getIt.get<ShippingCostRepoImpl>())..getCitiesData(),
        child: const AddShippingCostScreen(),
      ),
  RouteManager.coupons: (c) => const CouponsScreen(),
  RouteManager.addCoupon: (c) =>  BlocProvider(
        create: (context) => AddCouponsCubit(getIt.get<CouponsRepoImpl>()),
        child: const AddCouponScreen(),
      ),
};
