import '../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../widgets/custom_city_itm.dart';
import '../../view_model/cities_cubit/cities_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesCubit, CitiesState>(
      builder: (context, state) {
        CitiesCubit cubit = CitiesCubit.get(context);
        return SafeArea(
            child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              toNamed(
                context,
                RouteManager.addCity,
              );
            },
            child: const Icon(
              Icons.add,
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomAppBar(
                title: 'Cities',
                ispadding: true,
                isleading: true,
                onTap: () {
                  pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ConditionalBuilder(
                      condition: state is GetCitiesLoading,
                      builder: (context) => Column(
                        children: [
                          Center(
                            child: Lottie.asset(
                              LottieAssetsManager.loading,
                              width: 300,
                              height: 450,
                            ),
                          ),
                        ],
                      ),
                      fallback: (context) => ConditionalBuilder(
                        condition: cubit.citiesModel!.data.isEmpty,
                        builder: (context) => Center(
                          child: Lottie.asset(LottieAssetsManager.empty,
                              width: 250, height: 450),
                        ),
                        fallback: (context) => ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => CustomCityItem(
                            cityAR: cubit.citiesModel!.data[index].cityNameAr!,
                            cityEN: cubit.citiesModel!.data[index].cityNameEn!,
                            delete: () {
                              cubit.deleteCity(
                                context,
                                cubit.citiesModel!.data[index].cityId!,
                              );
                            },
                            edit: () {
                              toNamed(
                                context,
                                RouteManager.editCity,
                                arguments: {
                                  'citiesData': cubit.citiesModel!.data[index],
                                }
                              );
                            },
                          ),
                          itemCount: cubit.citiesModel!.data.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ));
      },
    );
  }
}
