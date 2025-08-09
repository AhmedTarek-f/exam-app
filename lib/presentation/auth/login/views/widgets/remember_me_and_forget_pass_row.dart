import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/core/constants/app_text.dart';
import 'package:exam_app/presentation/auth/login/views/widgets/forget_password_button.dart';
import 'package:exam_app/presentation/auth/login/views_model/login_cubit.dart';
import 'package:exam_app/presentation/auth/login/views_model/login_intent.dart';
import 'package:exam_app/presentation/auth/login/views_model/login_state.dart';

class RememberMeAndForgetPassRow extends StatelessWidget {
  const RememberMeAndForgetPassRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<LoginCubit>(context);
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (previous, current) =>
                    current is ToggleRememberMeState,
                builder: (context, state) => Checkbox(
                  value: controller.rememberMe,
                  onChanged: (_) async => await controller.doIntent(
                    intent: ToggleRememberMeIntent(),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  side: BorderSide(
                    width: 2.r,
                    color: Theme.of(context).colorScheme.scrim,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async =>
                    await controller.doIntent(intent: ToggleRememberMeIntent()),
                child: Text(
                  AppText.rememberMe,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
        const RSizedBox(width: 12),
        const ForgetPasswordButton(),
      ],
    );
  }
}
