import '../../../../../../core/functions/navigation/pop.dart';
import '../../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../../core/shared/widgets/custom_botton.dart';
import '../../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../view_model/add_delivery_account_cubit/add_delivery_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddDeliveryAccountScreen extends StatelessWidget {
  const AddDeliveryAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDeliveryAccountCubit, AddDeliveryAccountState>(
      builder: (context, state) {
        AddDeliveryAccountCubit cubit = AddDeliveryAccountCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: SafeArea(
              child: Scaffold(
            body: ListView(
              children: [
                CustomAppBar(
                  title: 'Add Delivery Account',
                  ispadding: true,
                  isleading: true,
                  onTap: () {
                    pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'the field is empty';
                          } else {
                            return null;
                          }
                        },
                        controller: cubit.nameController,
                        labelText: 'User Name',
                        hint: 'Enter your Name',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'the field is empty';
                          } else {
                            return null;
                          }
                        },
                        controller: cubit.emailController,
                        labelText: 'Email',
                        hint: 'Enter your email',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'the field is empty';
                          } else {
                            return null;
                          }
                        },
                        controller: cubit.phoneController,
                        labelText: 'Phone Number',
                        hint: 'Enter Phone Number',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'the field is empty';
                          } else {
                            return null;
                          }
                        },
                        controller: cubit.passwordController,
                        labelText: 'Password',
                        hint: 'Enter your Password',
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomBotton(
                        text: 'Add Account',
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.addDeliveryAccount(context);
                          }
                        },
                        radius: 30,
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
