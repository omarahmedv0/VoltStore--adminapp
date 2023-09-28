import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_botton.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../view_model/edit_city_cubit/edit_city_cubit.dart';

class EditCityScreen extends StatelessWidget {
  const EditCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCityCubit, EditCityState>(
      builder: (context, state) {
        EditCityCubit cubit = EditCityCubit.get(context);
        cubit.initialData(context);
        return Form(
          key: cubit.formKey,
          child: SafeArea(
              child: Scaffold(
            body: ListView(
              children: [
                CustomAppBar(
                  title: 'Edit City',
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
                        text: 'Save Changing',
                        onPressed: () {
                          if(cubit.formKey.currentState!.validate())
                          {
                            cubit.editCity(context);
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
