import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_botton.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../view_model/edit_cubit/edit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditCatScreen extends StatelessWidget {
  const EditCatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCatCubit, EditCatState>(
      builder: (context, state) {
        EditCatCubit cubit = EditCatCubit.get(context);
        cubit.initialData(context);
        return Form(
          key: cubit.formKey,
          child: SafeArea(
              child: Scaffold(
            body: ListView(
              children: [
                CustomAppBar(
                  title: 'Edit Category',
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
                                'Update Image',
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
                      CircleAvatar(
                      radius: 60.h,
                      backgroundImage:
                           cubit.file == null
                              ? NetworkImage(
                                  "${ApiLinks.categoriesImageLink}/${cubit.oldImage}",
                                )
                              : FileImage(cubit.file!)
                                  as ImageProvider,
                    ),
                
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomBotton(
                        text: 'Save Changes',
                        onPressed: () {
                          cubit.editCat(context);
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
