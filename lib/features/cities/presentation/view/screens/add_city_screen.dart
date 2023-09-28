import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_botton.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../view_model/add_city_cubit/add_city_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCityScreen extends StatelessWidget {
  const AddCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCityCubit, AddCityState>(
      builder: (context, state) {
        AddCityCubit cubit = AddCityCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: SafeArea(
              child: Scaffold(
            body: ListView(
              children: [
                CustomAppBar(
                  title: 'Add City',
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
                      CustomTextFormField(
                        controller: cubit.nameENcontroller,
                        labelText: 'English Name',
                        hint: 'Enter English Name of City',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'The field is Empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        controller: cubit.nameARcontroller,
                        labelText: 'Arabic Name',
                        hint: 'Enter Arabic Name of City',
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'The field is Empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomBotton(
                        radius: 30,
                        text: 'Add City',
                        onPressed: () {
                          if(cubit.formKey.currentState!.validate())
                          {
                            cubit.addCity(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
