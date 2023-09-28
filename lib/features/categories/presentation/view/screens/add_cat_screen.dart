import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_botton.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../view_model/addCatCubit/add_cat_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AddCatScreen extends StatelessWidget {
  AddCatScreen({super.key});

  TextEditingController c = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCatCubit, AddCatState>(
      builder: (context, state) {
        AddCatCubit cubit = AddCatCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: SafeArea(
              child: Scaffold(
            body: ListView(
              children: [
                CustomAppBar(
                  title: 'Add Category',
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
                        controller: cubit.nameEnController,
                        labelText: 'English Name',
                        hint: 'Enter English Name',
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
                        controller: cubit.nameArController,
                        labelText: 'Arabic Name',
                        hint: 'Enter Arabic Name',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      if (cubit.file != null)
                        Container(
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorsManager.green,
                          ),
                        ),
                      SizedBox(
                        height: 5.h,
                      ),
                      InkWell(
                        onTap: () {
                          cubit.chooseImage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: cubit.file != null
                                ? ColorsManager.primary
                                : ColorsManager.primary.withOpacity(
                                    .6,
                                  ),
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              const Expanded(
                                child: Icon(
                                  Icons.upload,
                                  color: ColorsManager.white,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'Upload Image',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: ColorsManager.white),
                              ),
                              const Spacer(flex: 2)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      if (cubit.file != null)
                        CircleAvatar(
                          radius: 60.h,
                          backgroundImage: FileImage(cubit.file!),
                        ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomBotton(
                        text: 'Add Category',
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            if (cubit.file != null) {
                              cubit.addCat(context);
                            } else {
                              customSnackBar(context, 'You must add a photo',
                                  AnimatedSnackBarType.info, 300);
                            }
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
