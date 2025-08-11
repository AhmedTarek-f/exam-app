import 'package:exam_app/core/router/route_names.dart';
import 'package:exam_app/presentation/auth/login/views/widgets/don_not_have_acc.dart';
import 'package:exam_app/presentation/auth/login/views/widgets/login_button.dart';
import 'package:exam_app/presentation/auth/login/views/widgets/login_form.dart';
import 'package:exam_app/presentation/auth/login/views/widgets/remember_me_and_forget_pass_row.dart';
import 'package:exam_app/presentation/auth/login/views_model/login_cubit.dart';
import 'package:exam_app/presentation/auth/login/views_model/login_state.dart';
import 'package:exam_app/utils/loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          Loaders.showErrorMessage(
            message: state.errorData.message,
            context: context,
          );
        } else if (state is LoginSuccessState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            RouteNames.homeBottomNavigation,
            (route) => false,
          );
        }
      },
      child: SingleChildScrollView(
        child: RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) =>
                current is LoginLoadingState || current is LoginFailureState,
            builder: (context, state) => AbsorbPointer(
              absorbing: state is LoginLoadingState,
              child: const Column(
                children: [
                  RSizedBox(height: 12),
                  LoginForm(),
                  RSizedBox(height: 15),
                  RememberMeAndForgetPassRow(),
                  RSizedBox(height: 63),
                  LoginButton(),
                  RSizedBox(height: 16),
                  DonNotHaveAcc(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
