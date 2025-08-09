import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views_model/email_verification_cubit.dart';
import 'package:exam_app/presentation/auth/forget_password/email_verification/views_model/email_verification_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationField extends StatelessWidget {
  const OtpVerificationField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<EmailVerificationCubit>(context);
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      buildWhen: (previous, current) =>
          current is OtpValidationErrorState ||
          current is ResendCodeLoadingState ||
          current is OTPValidationLoadingState ||
          current is ResendCodeFailureState ||
          current is ResendCodeSuccessState ||
          current is OTPValidationFailureState,
      builder: (context, state) => Column(
        children: [
          PinCodeTextField(
            enabled:
                state is! OTPValidationLoadingState &&
                state is! ResendCodeLoadingState,
            autovalidateMode: AutovalidateMode.disabled,
            appContext: context,
            hintCharacter: "-",
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            length: 6,
            textStyle: Theme.of(context).textTheme.titleLarge,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(6.r),
              fieldHeight: 65.h,
              fieldWidth: 47.h,
              activeFillColor: Theme.of(context).colorScheme.shadow,
              inactiveColor: const Color(0xffCDCED1),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            boxShadows: [
              BoxShadow(
                offset: const Offset(0, 1),
                color: Theme.of(context).colorScheme.primary,
                blurRadius: 10,
              ),
            ],
            // enabled: !controller.isLoading,
            onChanged: (value) => controller.onOtpValueChange(value: value),
          ),
          Visibility(
            visible: controller.otpValidationValue != null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RSizedBox(height: 8),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    controller.otpValidationValue ?? "",
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(fontSize: 14.sp),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
