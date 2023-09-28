import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/functions/init_app.dart';
import 'core/functions/initial_route.dart';
import 'features/accounts/data/repos/accounts_repo_impl.dart';
import 'features/accounts/presentation/view_model/admins_cubit/admins_accounts_cubit.dart';
import 'features/accounts/presentation/view_model/deliveries_cubit/deliveries_accounts_cubit.dart';
import 'features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'features/categories/data/repos/categories_repo_impl.dart';
import 'features/categories/presentation/view_model/categories_view_cubit/categories_cubit.dart';
import 'features/cities/data/repos/cities_repo_impl.dart';
import 'features/cities/presentation/view_model/cities_cubit/cities_cubit.dart';
import 'features/coupons/data/repos/coupons_repo_impl.dart';
import 'features/coupons/presentation/view_model/coupons_cubit/coupons_cubit.dart';
import 'features/orders/data/repos/orders_repo_impl.dart';
import 'features/orders/presentation/view_model/order_details_cubit/order_details_cubit.dart';
import 'features/orders/presentation/view_model/orders_pending_cubit/orders_pending_cubit.dart';
import 'features/products/data/repos/products_repo_impl.dart';
import 'features/products/presentation/view_model/product_details_cubit/product_details_cubit.dart';
import 'features/products/presentation/view_model/products_view_cubit/products_view_cubit.dart';
import 'features/shipping_cost/data/repos/shipping_cost_repo_impl.dart';
import 'features/shipping_cost/presentation/view_model/shipping_cost_cubit/shipping_cost_cubit.dart';
import 'injections.dart';
import 'routes.dart';
import 'themes/theme_manager.dart';

void main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  initialInjections();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginCubit(getIt.get<LoginRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                 CategoriesCubit(getIt.get<CategoriesRepoImpl>())..getCategoriesData(),
            ),
            BlocProvider(
              create: (context) =>
                  ProductsViewCubit(getIt.get<ProductsRepoImpl>())..getProductsData(),
            ),
            BlocProvider(
              create: (context) => ProductDetailsCubit(getIt.get<ProductsRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => OrdersPendingCubit(getIt.get<OrdersRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>OrderDetailsCubit(getIt.get<OrdersRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>AdminsAccountsCubit(getIt.get<AccountsRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => DeliveriesAccountsCubit(getIt.get<AccountsRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  ShippingCostCubit(getIt.get<ShippingCostRepoImpl>())..getShippingCostData(),
            ),
            BlocProvider(
              create: (context) => CitiesCubit(getIt.get<CitiesRepoImpl>())..getCities(),
            ),
            BlocProvider(
              create: (context) => CouponsCubit(getIt.get<CouponsRepoImpl>())..getCouponsData(),
            ),
          ],
          child: MaterialApp(
            initialRoute: initialRoute(),
            routes: routes,
            debugShowCheckedModeBanner: false,
            theme: ThemeManager.theme,
          ),
        );
      },
    );
  }
}
