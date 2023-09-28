import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_botton.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../widgets/edit_product/custom_drop_down_edit_product.dart';
import '../../view_model/edit_product_cubit/edit_product_cubit.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProductCubit, EditProductState>(
      builder: (context, state) {
        EditProductCubit cubit = EditProductCubit.get(context);
        cubit.initialData(context);
        return Form(
          key: cubit.formKey,
          child: SafeArea(
            child: Scaffold(
              body: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomAppBar(
                    title: 'Edit Product',
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
                        CustomTextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'the field is empty';
                            } else {
                              return null;
                            }
                          },
                          controller: cubit.descEnController,
                          labelText: 'English description',
                          hint: 'Enter English description',
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
                          controller: cubit.descArController,
                          labelText: 'Arabic description',
                          hint: 'Enter Arabic description',
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
                          controller: cubit.priceController,
                          labelText: 'Price',
                          hint: 'Enter Product Price',
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
                          controller: cubit.discountEnController,
                          labelText: 'Discount',
                          hint: 'Enter Discount',
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
                          controller: cubit.countController,
                          labelText: 'Count',
                          hint: 'Enter Count',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomDropBottonEditProduct(
                          text: 'Select Color1',
                          list: cubit.colorList,
                          onChanged: (String? value) {
                            cubit.onColor1Changed(value);
                          },
                          valueSelected: cubit.color1Seleted,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomDropBottonEditProduct(
                          text: 'Select Color2',
                          list: cubit.colorList,
                          onChanged: (String? value) {
                            cubit.onColor2Changed(value);
                          },
                          valueSelected: cubit.color2Seleted,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomDropBottonEditProduct(
                          text: 'Select Color3',
                          list: cubit.colorList,
                          onChanged: (String? value) {
                            cubit.onColor3Changed(value);
                          },
                          valueSelected: cubit.color3Seleted,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomDropBottonEditProduct(
                          text: 'Select Size1',
                          list: cubit.sizeList,
                          onChanged: (String? value) {
                            cubit.onsize1Changed(value);
                          },
                          valueSelected: cubit.size1Seleted,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomDropBottonEditProduct(
                          text: 'Select Size2',
                          list: cubit.sizeList,
                          onChanged: (String? value) {
                            cubit.onsize2Changed(value);
                          },
                          valueSelected: cubit.size2Seleted,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomDropBottonEditProduct(
                          text: 'Select Size3',
                          list: cubit.sizeList,
                          onChanged: (String? value) {
                            cubit.onsize3Changed(value);
                          },
                          valueSelected: cubit.size3Seleted,
                        ),
                        SizedBox(
                          height: 15.h,
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
                       
                          CircleAvatar(
                            radius: 60.h,
                            backgroundColor: ColorsManager.grey.withOpacity(.3),
                            backgroundImage: cubit.file == null
                                ? NetworkImage(
                                    "${ApiLinks.productsImagesLink}/${cubit.productData!.productImage}",
                                  )
                                : FileImage(cubit.file!) as ImageProvider,
                          ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomBotton(
                          text: 'Edit Product',
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              if (cubit.color1Seleted == null &&
                                  cubit.color2Seleted == null &&
                                  cubit.color3Seleted == null) {
                                customSnackBar(
                                  context,
                                  'Please Select Color',
                                  AnimatedSnackBarType.info,
                                  300,
                                );
                              } else if (cubit.size1Seleted == null &&
                                  cubit.size2Seleted == null &&
                                  cubit.size3Seleted == null) {
                                customSnackBar(
                                  context,
                                  'Please Select Size',
                                  AnimatedSnackBarType.info,
                                  300,
                                );
                              } else
                              {
                                cubit.editProduct(context);
                              }
                              
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
