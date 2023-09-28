import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/functions/alert_exit_app.dart';
import '../../../../../../core/functions/valid_input/valid_input_fun.dart';
import '../../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../../core/shared/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/login_cubit/login_cubit.dart';
import '../../widgets/custom_logo_auth.dart';
import '../../widgets/custom_text_body_auth.dart';
import '../../widgets/custom_textbottom_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = LoginCubit.get(context);

        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorsManager.white,
            body: WillPopScope(
              onWillPop: () => alertExitApp(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: cubit.formKeyForLogin,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          CustomAppBar(
                            title: 'Login',
                            isleading: false,
                            ispadding: false,
                          ),
                          const CustomLogoAuth(),
                          CustomTextBodyAuth(
                            body: 'This App For Admins',
                            title: 'Wolcome in Volt Store',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormField(
                            controller: cubit.emailControllerLogin,
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Enter your email',
                            labelText: 'email',
                            validator: (s) {
                              return validInputFun(s!, 11, 100, 'email');
                            },
                            suffIcon: const Icon(
                              Icons.email_outlined,
                              color: ColorsManager.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          CustomTextFormField(
                            onTapIcon: () {
                              cubit.showandHidePassword();
                            },
                            obscureText: cubit.obscureText,
                            controller: cubit.passwordControllerLogin,
                            keyboardType: TextInputType.visiblePassword,
                            hint: 'Enter your password',
                            labelText: 'password',
                            suffIcon: cubit.obscureText == false
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: ColorsManager.primary,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: ColorsManager.grey,
                                  ),
                            validator: (s) {
                              return validInputFun(s!, 8, 100, 'password');
                            },
                          ),
                          SizedBox(
                            height: 5.sp,
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          CustomTextBottomAuth(
                            fun: () {
                              if (cubit.formKeyForLogin.currentState!
                                  .validate()) {
                                cubit.login(context);
                              }
                            },
                            text: 'Login',
                          ),
                        
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
