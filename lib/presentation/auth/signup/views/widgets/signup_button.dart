import 'package:exam_app/core/common_widgets/custom_elevated_button.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/auth/signup/views_model/sign_up_intent.dart';
import 'package:exam_app/presentation/auth/signup/views_model/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          current is SignUpLoadingState || current is SignUpFailureState,
      builder: (context, state) => CustomElevatedButton(
        buttonTitle: state is SignUpLoadingState
            ? AppText.signupDots
            : AppText.signup,
        onPressed: state is SignUpLoadingState
            ? () {}
            : () async {
                await controller.doIntent(
                  intent: SignupWithEmailAndPasswordIntent(),
                );
              },
      ),
    );
  }
}
